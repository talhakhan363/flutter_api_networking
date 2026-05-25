// --> Handles all HTTP requests

import 'dart:convert';
import 'package:http/http.dart' as http; // --> Aliasing to make calling http methods easier
import '../models/user_model.dart';

class ApiService {
  // --> Using JSONPlaceholder as our public API
  static const String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  // --> Future function because we have to wait for the internet to respond
  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      // --> 200 is the standard HTTP status code for "OK / Success"
      if (response.statusCode == 200) {
        List<dynamic> decodedData = json.decode(response.body); // --> Parsing JSON

        // --> Converting the list of JSON maps into a list of UserModel objects
        return decodedData.map((json) => UserModel.fromJson(json)).toList();
      } else {
        // --> Handling server errors (e.g., 404 Not Found)
        throw Exception('Failed to load users. Server responded with: ${response.statusCode}');
      }
    } catch (e) {
      // --> Handling network/internet connectivity errors
      throw Exception('Network error. Please check your internet connection.');
    }
  }
}
