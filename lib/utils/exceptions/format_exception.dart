class TFormatException implements Exception {
  final String message;

  TFormatException(
      [this.message =
          'An unexpected format error ocurred,Please check your input. ']);

  // create a format exception from a specific error message

  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  String get formattedMessage => message;

  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return TFormatException(
            'The email address format is invalid.Please enter a valid email.');
      case 'invalid-phone-number-format':
        return TFormatException(
            'The Provided phone number format is invalid.Plese enter a valid number.');
      case 'invalid-date-format':
        return TFormatException(
            'The date format is invalid. Please enter a valid date');
      case 'invalid-url-format':
        return TFormatException(
            'The URL format is invalid. Please enter a valid URL');
      case 'invalid-numeric-format':
        return TFormatException('The input should be a numeric format');
      default:
        return TFormatException('');
    }
  }
}
