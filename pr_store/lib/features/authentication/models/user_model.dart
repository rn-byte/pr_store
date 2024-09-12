import 'package:pr_store/utils/formatters/formatter.dart';

class UserModel {
  /// keep those value final which we don't want to change
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.userName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// Helper Function to get the full-name
  String get fullName => '$firstName $lastName';

  /// Helper fucnction to format PhoneNumber
  String get formattedPhoneNo => PrFormatter.formatPhoneNumber(phoneNumber);

  /// Static fuction to split full-name to firstName and lastName
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// static function to generate username from fullName
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';

    String camelCaseUsername = '$firstName$lastName';
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  /// static function to create an empty user model
  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      userName: '',
      lastName: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  /// Factory constructor to create a UserModel from JSON.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      firstName: json['firstName'] ?? '',
      userName: json['userName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
    );
  }

  /// Method to convert UserModel to JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'userName': userName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }
}
