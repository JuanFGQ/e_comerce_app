//ITS NEEDED TO IMPORT INTL PACKAGE FOR DELETE THIS ERROR

import 'package:intl/intl.dart';

class JFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    //assuming a 1' -digit US phone number format : (123) 456-7890
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)})';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }
    //ADD more custom phone number formatting logic for a different format if needed
    return phoneNumber;
  }

  static String internationalFormatPhoneNumber(String phoneNumber) {
    //remove any non numeric digits from the phoneNumber
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), 'replace');

    //extract the contry code from the digitsOnly

    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);

    //add the remaining digits with proper formatting
    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode)');

    int i = 0;
    while (i < digitsOnly.length) {
      int groupLenght = 2;
      if (i == 0 && countryCode == '+1') {
        groupLenght = 3;
      }
      int end = i + groupLenght;

      formattedNumber.write(digitsOnly.substring(i, end));

      if (end < digitsOnly.length) {
        formattedNumber.write(' ');
      }
      i = end;
    }
    return phoneNumber;
  }
}
