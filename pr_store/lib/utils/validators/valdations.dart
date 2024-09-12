class PrValidator {
  ///Empty field validation
  static String? validateEmptyField(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is Required.';
    }

    ///Regular Expression for email validations
    final emailRegExp = RegExp(
        r'^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid Email Address.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is Required.';
    }

    ///Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 character long.';
    }

    ///Check for UPPERCASE letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one Uppercase letter.';
    }

    ///Check for NUMBER
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one Number .';
    }

    ///Check for SPECIAL CHARACTERS
    if (!value.contains(RegExp(r'[!@#\$%^&*(),.+"\-=\[\]{}\/|<>]'))) {
      return 'Password must contain at least one Special Characters .';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number is Required.';
    }
    //Regular Expression for phone number validation(assuming 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid Phone Number Format (10 digit required)';
    }
    return null;
  }
}
