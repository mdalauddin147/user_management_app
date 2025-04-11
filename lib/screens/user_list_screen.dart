import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_provider.dart';
import '../widgets/user_card.dart';

/// The main screen that displays a list of users fetched from an API.
/// Includes search functionality to filter users by name.
class UserListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the asynchronous user list provider
    final usersAsync = ref.watch(userListProvider);

    // Watch the current search query
    final searchQuery = ref.watch(searchQueryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('User Management')),

      // Body contains the search bar and user list
      body: Column(
        children: [
          // Search TextField
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) =>
              ref.read(searchQueryProvider.notifier).state = value, // update query
              decoration: const InputDecoration(
                hintText: 'Search user by name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),

          // Main user list or loading/error states
          Expanded(
            child: usersAsync.when(
              data: (users) {
                // Filter users by search query
                final filtered = ref.watch(filteredUsersProvider);

                if (filtered.isEmpty) {
                  return const Center(child: Text("No users found"));
                }

                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (_, i) => UserCard(user: filtered[i]),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => const Center(child: Text('Failed to fetch users')),
            ),
          ),
        ],
      ),
    );
  }
}
