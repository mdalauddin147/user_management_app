import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';
import '../services/user_service.dart';

final userServiceProvider = Provider((ref) => UserService());

final userListProvider = FutureProvider<List<User>>((ref) async {
  final service = ref.read(userServiceProvider);
  return service.fetchUsers();
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final filteredUsersProvider = Provider<List<User>>((ref) {
  final query = ref.watch(searchQueryProvider).toLowerCase();
  final asyncUsers = ref.watch(userListProvider);

  return asyncUsers.when(
    data: (users) => users.where((u) => u.name.toLowerCase().contains(query)).toList(),
    loading: () => [],
    error: (_, __) => [],
  );
});
