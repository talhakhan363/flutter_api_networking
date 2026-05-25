// --> Displays the ListView

import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';
import 'user_profile_screen.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({super.key});

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<UserModel>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _usersFuture = _apiService.fetchUsers(); // --> Trigger the API call when screen loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        titleTextStyle: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
        title: const Text("API Users List"),
      ),
      // --> FutureBuilder is perfect for UI indicators based on network states
      body: FutureBuilder<List<UserModel>>(
        future: _usersFuture,
        builder: (context, snapshot) {
          // 1. Loading State [cite: 89]
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.blue), // --> Loading spinner
            );
          }
          // 2. Error State [cite: 87, 88]
          else if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Error: ${snapshot.error}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, color: Colors.redAccent),
                ),
              ),
            );
          }
          // 3. Success State [cite: 81]
          else if (snapshot.hasData) {
            List<UserModel> users = snapshot.data!;

            return ListView.separated(
              itemCount: users.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                var user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue.shade100,
                    child: Text(user.name[0], style: TextStyle(color: Colors.blue.shade700)),
                  ),
                  title: Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(user.email),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // --> Navigate to Profile Screen and pass the user data
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfileScreen(user: user)));
                  },
                );
              },
            );
          }

          return const Center(child: Text("No data found."));
        },
      ),
    );
  }
}
