import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

/// Service class responsible for fetching user data from the API
class UserService {
  /// Fetches a list of users from the ReqRes API
  /// Returns a list of User objects
  Future<List<User>> fetchUsers() async {
    // Send GET request to the API endpoint
    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=1'),
    );

    // If the response is successful (status code 200)
    if (response.statusCode == 200) {
      // Decode the JSON body and extract the 'data' list
      final List users = jsonDecode(response.body)['data'];

      // Map each user JSON to a User model and return the list
      return users.map((json) => User.fromJson(json)).toList();
    } else {
      // Throw an exception if the API call fails
      throw Exception('Failed to load users');
    }
  }
}
