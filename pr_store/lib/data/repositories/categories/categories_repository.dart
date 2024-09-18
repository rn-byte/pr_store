import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pr_store/features/shop/models/category_model.dart';
import 'package:pr_store/utils/exceptions/firebase_exceptions.dart';
import 'package:pr_store/utils/exceptions/platform_exceptions.dart';

class CategoriesRepository extends GetxController {
  static CategoriesRepository get instance => Get.find();

  /// VARIABLES
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      // getting all the categories
      final snapshot = await _db.collection('categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw PrFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw PrPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please Try Again !';
    }
  }

  /// Get Sub Categories
  /// upload categories to cloud firebase
  Future<List<CategoryModel>> uploadDummyData(
      List<CategoryModel> categories) async {
    try {
      // getting all the categories
      final snapshot = await _db.collection('categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw PrFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw PrPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please Try Again !';
    }
  }
}
