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

  /// Get product based on wishlist
  Future<List<ProductModel>> getFavouriteProducts(List<String>? productIds) async {
    try {
      // Check if productIds is null or empty
      if (productIds == null || productIds.isEmpty) {
        // Return an empty list if there are no product IDs
        return [];
      }

      // Perform Firestore query if productIds is not empty
      final snapshot =
          await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
      return snapshot.docs
          .map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw PrFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw PrPlatformExceptions(e.code).message;
    } catch (e) {
      //print('Exception:=>${e.toString()}');
      throw 'Something went wrong. Please try Again !!';
    }
  }

  /// Get product on the basis of brand
  Future<List<ProductModel>> getProductForBrand({required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).get()
          : await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit)
              .get();
      final products = querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;
    } on FirebaseException catch (e) {
      throw PrFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw PrPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try Again !!';
    }
  }

  /// Get product on the basis of category
  Future<List<ProductModel>> getProductsForCategory(
      {required String categoryId, int limit = 4}) async {
    try {
      /// Query to get all document where productId matches the  provided categoryId and fetch limited or unlimited data base on limit
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db.collection('ProductCategory').where('CategoryId', isEqualTo: categoryId).get()
          : await _db
              .collection('ProductCategory')
              .where('CategoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();

      /// Extract productId from the documents
      List<String> productIds =
          productCategoryQuery.docs.map((doc) => doc['ProductId'] as String).toList();

      /// Query to get all the document where brandId is in the list of brandIds, FieldPath.documentId to query document in collections
      final productQuery =
          await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();

      /// Extract brand names or other relevant data from the documents
      List<ProductModel> products =
          productQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();

      return products;
    } on FirebaseException catch (e) {
      throw PrFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw PrPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try Again !!';
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
