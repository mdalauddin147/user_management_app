import 'package:flutter/material.dart';
import '../models/user.dart';

/// A screen that displays the details of a selected user.
class UserProfileScreen extends StatelessWidget {
  /// The user whose details are to be shown.
  final User user;

  /// Constructor with required user parameter
  const UserProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with user's name as the title
      appBar: AppBar(title: Text(user.name)),

      // Main content with padding
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display user's avatar
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.avatar),
            ),
            const SizedBox(height: 20),

            // Display user's full name
            Text(
              user.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            // Display user's email
            Text(
              user.email,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
