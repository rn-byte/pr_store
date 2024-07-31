class PrValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is Required.';
    }

    ///Regular Expression for email validations
    final emailRegExp =
        RegExp(r'^.+@[a-zA-Z]+\.{{1}[a-zA-Z]+(\.{0.1}[a-zA-Z]+)$ ');
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
      return 'Password must be atleast 6 character long.';
    }

    ///Check for UPPERCASE letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain atleast one Uppercase letter.';
    }

    ///Check for NUMBER
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain atleast one Number .';
    }

    ///Check for SPECIAL CHARACTERS
    if (!value.contains(RegExp(r'[!@#\$%^&*(),.+"-=[]{}/|<>]'))) {
      return 'Password must contain atleast one Special Characters .';
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
