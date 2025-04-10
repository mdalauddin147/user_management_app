import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_provider.dart';
import '../screens/user_profile_screen.dart';
import '../widgets/user_card.dart';

class UserListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(userListProvider);
    final searchQuery = ref.watch(searchQueryProvider);

    return Scaffold(
      appBar: AppBar(title: Text('User Management')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) => ref.read(searchQueryProvider.notifier).state = value,
              decoration: InputDecoration(
                hintText: 'Search user by name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),   
          ),
          Expanded(
            child: usersAsync.when(
              data: (users) {
                final filtered = ref.watch(filteredUsersProvider);
                if (filtered.isEmpty) return Center(child: Text("No users found"));
                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (_, i) => UserCard(user: filtered[i]),
                );
              },
              loading: () => Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Failed to fetch users')),
            ),
          ),
        ],
      ),
    );
  }
}
