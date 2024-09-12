import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pr_store/features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  /// Variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to Save user Data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw PrFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const PrFormatException();
    } on PlatformException catch (e) {
      throw PrPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went Wrong, Please Try Again!';
    }
  }
}
