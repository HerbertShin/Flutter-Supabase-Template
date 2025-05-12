class Validation {
  /// Validates an email address.
  ///
  /// This method checks if the provided [value] is a non-empty string and matches
  /// the standard email format. If the [value] is null or empty, it returns an
  /// error message prompting the user to enter an email. If the [value] does not
  /// match the email format, it returns an error message indicating the email
  /// address is invalid. Otherwise, it returns `null`, indicating the email is valid.
  ///
  /// - Parameter [value]: The email address to validate.
  /// - Returns: A string containing an error message if the email is invalid,
  ///   or `null` if the email is valid.
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  /// Validates a password string.
  ///
  /// This method checks if the provided [value] is null, empty, or does not meet
  /// the minimum length requirement of 8 characters. Additionally, it ensures
  /// the password contains at least one uppercase letter, one lowercase letter,
  /// one number, and one special character. If any of these conditions are not met,
  /// an appropriate error message is returned. Otherwise, it returns `null`,
  /// indicating the password is valid.
  ///
  /// - Returns: 
  ///   - A `String` error message if the password is invalid.
  ///   - `null` if the password is valid.
  ///
  /// - Parameters:
  ///   - [value]: The password string to validate.
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    final hasUppercase = RegExp(r'[A-Z]');
    final hasLowercase = RegExp(r'[a-z]');
    final hasDigit = RegExp(r'\d');
    final hasSpecialCharacter = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    
    if (!hasUppercase.hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!hasLowercase.hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!hasDigit.hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    if (!hasSpecialCharacter.hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }
}
