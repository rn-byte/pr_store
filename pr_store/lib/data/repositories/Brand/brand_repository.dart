import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pr_store/features/shop/models/brand_model.dart';
import 'package:pr_store/utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// Variable
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw PrFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const PrFormatExceptions();
    } on PlatformException catch (e) {
      throw PrPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try Again !!}';
    }
  }

  /// Get brand for category
}
