import 'package:intl/intl.dart';
import 'package:libphonenumber/libphonenumber.dart';

class PrFormatter {
  PrFormatter._();
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-YYYY').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    //Assuming  10-digit US Phone Number :(123) 456-7890
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }
    return phoneNumber;
  }

  //format international phoneNumber
  // Method to format an international phone number
  static Future<String> formatInternationalPhoneNumber(
      String phoneNumber, String regionCode) async {
    try {
      bool isValid = await PhoneNumberUtil.isValidPhoneNumber(
              phoneNumber: phoneNumber, isoCode: regionCode) ??
          false;

      if (isValid) {
        String formatted = await PhoneNumberUtil.formatAsYouType(
                phoneNumber: phoneNumber, isoCode: regionCode) ??
            phoneNumber;

        return formatted;
      } else {
        return "Invalid phone number";
      }
    } catch (e) {
      return "Error formatting phone number";
    }
  }
}
