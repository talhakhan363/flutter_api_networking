// --> Displays specific user details

import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserProfileScreen extends StatelessWidget {
  final UserModel user;

  const UserProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // --> Generates a custom profile picture using a free avatar API based on the user's name
    String avatarUrl = 'https://ui-avatars.com/api/?name=${user.name.replaceAll(' ', '+')}&size=256&background=0D8ABC&color=fff';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(user.username, style: const TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --> Displaying Profile Picture [cite: 85]
            CircleAvatar(radius: 60, backgroundImage: NetworkImage(avatarUrl)),
            Container(height: 21), // --> Your custom spacing
            // --> Displaying User Details [cite: 85]
            Text(user.name, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.email, color: Colors.grey),
                const SizedBox(width: 8),
                Text(user.email, style: const TextStyle(fontSize: 18, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
