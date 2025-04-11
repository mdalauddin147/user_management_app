/// Utility class for form field validations
class Validators {
  /// Validates the name input
  /// Returns an error message if the name is empty or null
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required'; // Validation fails
    }
    return null; // Validation passes
  }

  /// Validates the email input
  /// Returns an error message if email is empty or not in proper format
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required'; // Validation fails
    }

    // Simple regex to check email format
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email'; // Invalid format
    }

    return null; // Validation passes
  }
}
