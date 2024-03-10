class JPlatformException implements Exception {
  final String code;

  JPlatformException(this.code);

  String get message {
    switch (code) {
      case 'INVALID-LOGIN-CREDENTIAL':
        return 'Invalid login credential. Please double check your information';
      case 'too-many-requests':
        return 'Too many reuqests. please try again later.';
      case 'invalid-argument':
        return 'Invalid argument provided to the authentication method';
      case 'invalid-password':
        return 'Incorrect password. Please try again.';
      case 'invlaid-phone-number':
        return 'The provided phone number is invalid.';
      case 'operation-not-allowed':
        return 'The sign-in provider is disabled for your Firebase project';
      case 'session-cookie-expired':
        return 'The firebase session cookie has expired.Please sign in again.';
      case 'uid-already-exists':
        return 'The provided user ID is already in use by another user';
      case 'sign-in-failed':
        return 'Sing-in failed. Please try again.';
      case 'network-request-failed':
        return 'Network request failed. Please check your internet connection.';
      case 'internal-error':
        return 'something wrong has been occurred.Please try again later.';
      case 'invalid-verification-code':
        return 'Invalid verification code. request another new.';

      case 'invalid-verification-id':
        return 'Invalid verification id';
      default:
        return 'There`s an error, Please try again later.';
    }
  }
}