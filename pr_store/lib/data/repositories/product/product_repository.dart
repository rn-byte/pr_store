import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import 'package:pr_store/utils/exceptions/firebase_exceptions.dart';
import 'package:pr_store/utils/exceptions/platform_exceptions.dart';
import '../../../utils/constants/enum.dart';
import '../../services/firebase_storage_service.dart';

/// Repository for managing product related data and operations
class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// Firestore Instance for database intractions
  final _db = FirebaseFirestore.instance;

  /// Get limited Featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot =
          await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(4).get();

      // for (var doc in snapshot.docs) {
      //     Log the data to check if fields are correct
      // }

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw PrFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw PrPlatformExceptions(e.code).message;
    } catch (e) {
      //print('${e.toString()}');
      throw 'Something went wrong. Please try Again !!}';
    }
  }

  /// Get All Featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).get();

      // for (var doc in snapshot.docs) {
      //     Log the data to check if fields are correct
      // }

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw PrFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw PrPlatformExceptions(e.code).message;
    } catch (e) {
      //print('${e.toString()}');
      throw 'Something went wrong. Please try Again !!}';
    }
  }

  /// Get product based on brand
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList =
          querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
    } on FirebaseException catch (e) {
      throw PrFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw PrPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try Again !!}';
    }
  }

  /// Upload dummy data to cloud firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      /// Upload all the product along with their image
      final storage = Get.put(PrFirebaseStorageService());

      /// Loop through each product
      for (var product in products) {
        /// get image data link from local assets
        final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

        /// Upload image and get its Url
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        /// Assign Url to product thumbnail  attribute
        product.thumbnail = url;

        /// Product list of image
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrl = [];
          for (var image in product.images!) {
            /// Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            /// Upload image and get its URL
            final url = await storage.uploadImageData('Product/Images', assetImage, image);

            /// Assign Url to product Thumbanil attribute
            imageUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageUrl);

          /// Upload Variation images
          if (product.productType == ProductType.variable.toString()) {
            for (var variation in product.productVariations!) {
              /// Get image data link from local assets
              final assetImage = await storage.getImageDataFromAssets(variation.image);

              /// Upload image and its URL
              final url =
                  await storage.uploadImageData('Product/Images', assetImage, variation.image);

              /// Assign url to variation.image attribute
              variation.image = url;
            }
          }

          /// store product in Firestore
          await _db.collection('Products').doc(product.id).set(product.toJson());
        }
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
