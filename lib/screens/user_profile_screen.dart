import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProfileScreen extends StatelessWidget {
  final User user;

  const UserProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(radius: 50, backgroundImage: NetworkImage(user.avatar)),
            SizedBox(height: 20),
            Text(user.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(user.email, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
