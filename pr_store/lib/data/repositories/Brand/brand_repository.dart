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
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      /// Query to get all documents where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery =
          await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get();

      /// Extract brandId from the document
      List<String> brandIds =
          brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();

      /// Query to get all the document where brandId is in the list of brandIds, FieldPath.documentId to query document in collections
      final brandQuery = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();

      /// Extract brand names or other relevant data from the documents
      List<BrandModel> brands = brandQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
      return brands;
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
}
