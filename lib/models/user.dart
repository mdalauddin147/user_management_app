/// A data model representing a user fetched from the API.
class User {
  /// Unique identifier for the user
  final int id;

  /// Full name of the user (constructed from first and last names)
  final String name;

  /// Email address of the user
  final String email;

  /// URL to the user's avatar image
  final String avatar;

  /// Constructor to create a [User] instance
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
  });

  /// Factory constructor to create a [User] from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: '${json['first_name']} ${json['last_name']}',
      email: json['email'],
      avatar: json['avatar'],
    );
  }
}
