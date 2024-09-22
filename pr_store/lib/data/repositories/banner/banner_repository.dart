import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pr_store/features/shop/models/banner_models.dart';
import 'package:pr_store/utils/exceptions/firebase_exceptions.dart';
import 'package:pr_store/utils/exceptions/format_exceptions.dart';
import 'package:pr_store/utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all order related to current user
  Future<List<BannerModels>> fetchBanners() async {
    try {
      final result = await _db.collection('Banners').where('Active', isEqualTo: true).get();
      return result.docs
          .map((documentSnapshot) => BannerModels.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw PrFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const PrFormatExceptions();
    } on PlatformException catch (e) {
      throw PrPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching banners';
    }
  }

  /// Upload banner to cloud firestore
}
