import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';
import '../services/user_service.dart';

/// Provider for accessing the UserService class
final userServiceProvider = Provider((ref) => UserService());

/// Async provider that fetches a list of users from the API
final userListProvider = FutureProvider<List<User>>((ref) async {
  final service = ref.read(userServiceProvider); // Get the service instance
  return service.fetchUsers(); // Fetch users from API
});

/// State provider that holds the current search query (used in search field)
final searchQueryProvider = StateProvider<String>((ref) => '');

/// Provider that filters the user list based on the current search query
final filteredUsersProvider = Provider<List<User>>((ref) {
  final query = ref.watch(searchQueryProvider).toLowerCase(); // Lowercase search query
  final asyncUsers = ref.watch(userListProvider); // Watch the user fetch provider

  // When data is loaded, filter based on name
  return asyncUsers.when(
    data: (users) =>
        users.where((u) => u.name.toLowerCase().contains(query)).toList(),
    loading: () => [], // While loading, return empty list
    error: (_, __) => [], // On error, return empty list
  );
});
