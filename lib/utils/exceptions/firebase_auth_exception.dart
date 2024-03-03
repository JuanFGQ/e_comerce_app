class JFirebaseAuthException implements Exception {
//The error code associated with the exception
  final String code;

  JFirebaseAuthException(this.code);

// get the corresponding error message based on error code
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered. please use a different email';
      case 'invalid-email':
        return 'The email address provided is invalid. please enter a different email';
      case 'weak-password':
        return 'The password is too weak.Please choose a stronger password ';
      case 'user-disabled':
        return 'The user account has been disabled. please contact support for assitance ';
      case 'user-not-found':
        return 'Invalid login details. User not found';
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again.';
      case 'invalid-verification-code':
        return 'Invalid verification code.Please enter a valid code';
      case 'invalid-verification-id':
        return 'Invalid verification id.Please request a new verification code';
      case 'quota-exceeded':
        return 'Quota exceeded.Please try again later';
      case 'email-already-exists':
        return 'The email address already exists, Please use a different email';
      case 'provider-already-linked':
        return 'The account is already linked with another provider';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recen authentication';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account';
      case 'user-mismatch':
        return 'The suplied credentials do not correspond to a previously sign in credential';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email but different sign-in credentials';
      case 'operation not allowed':
        return 'This operation is not allowed. Contact for support assitance';
      case 'expired-action-code':
        return 'The action code has expired.please request a new action code';
      case 'invalid-action-code':
        return 'The action code is invalid.Please check the code and try again';
      case 'missing-action-code':
        return 'The action code is missin.Please provide a valid action code';
      case 'user-token-expired':
        return 'The user token has expired, and authentication is required. Please sign in again';

      case 'invalid-credential':
        return 'The supplied credential is malformed or has expired';

      case 'user-token-revoked':
        return 'The user token has been revoked. Please sign in again.';

      default:
        return 'Somethin happened try again later';
    }
  }
}
