class Validator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is Empty';
    }
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required.";
    }

    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegExp.hasMatch(value)) {
      return "Invalid email address";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required.";
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm password is required.";
    }
    if (password != confirmPassword) {
      return "Passwords do not match.";
    }
    return null;
  }
}
