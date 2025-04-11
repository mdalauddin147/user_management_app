import 'package:flutter/material.dart';
import '../models/user.dart';
import '../screens/user_profile_screen.dart';

/// A reusable widget that displays user information in a ListTile.
/// When tapped, it navigates to the user's profile screen.
class UserCard extends StatelessWidget {
  /// The user to display
  final User user;

  /// Constructor with required `user` parameter
  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // User avatar displayed as leading icon
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatar), // Load avatar from URL
      ),

      // User name as the main title
      title: Text(user.name),

      // User email as subtitle
      subtitle: Text(user.email),

      // When tapped, navigate to the user profile screen and pass the user object
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => UserProfileScreen(user: user),
          ),
        );
      },
    );
  }
}
