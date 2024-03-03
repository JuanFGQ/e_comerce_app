class JFormatException implements Exception {
  final String message;

  JFormatException(
      [this.message =
          'An unexpected format error ocurred,Please check your input. ']);

  // create a format exception from a specific error message

  factory JFormatException.fromMessage(String message) {
    return JFormatException(message);
  }

  String get formattedMessage => message;

  factory JFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return JFormatException(
            'The email address format is invalid.Please enter a valid email.');
      case 'invalid-phone-number-format':
        return JFormatException(
            'The Provided phone number format is invalid.Plese enter a valid number.');
      case 'invalid-date-format':
        return JFormatException(
            'The date format is invalid. Please enter a valid date');
      case 'invalid-url-format':
        return JFormatException(
            'The URL format is invalid. Please enter a valid URL');
      case 'invalid-numeric-format':
        return JFormatException('The input should be a numeric format');
      default:
        return JFormatException('');
    }
  }
}
