//Custom exception class to handle various format-related errors.
class PrFormatExceptions implements Exception {
  /// The associated error message.
  final String message;

  /// Default constructor with a generic error message.
  const PrFormatExceptions(
      [this.message =
          'An unexpected format error occurred. Please check your input.']);

  /// Create a format exception from a specific error message.
  factory PrFormatExceptions.fromMessage(String message) {
    return PrFormatExceptions(message);
  }

  /// Get the corresponding error message.
  String get formattedMessage => message;

  /// Create a format exception from a specific error code.
  factory PrFormatExceptions.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const PrFormatExceptions(
            'The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const PrFormatExceptions(
            'The provided phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return const PrFormatExceptions(
            'The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return const PrFormatExceptions(
            'The URL format is invalid. Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return const PrFormatExceptions(
            'The credit card format is invalid. Please enter a valid credit card number.');

      default:
        return const PrFormatExceptions(
            'An unexcepted Firebase error occured. Please try again');
    }
  }
}
