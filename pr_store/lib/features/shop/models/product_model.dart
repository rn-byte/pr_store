import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pr_store/features/shop/models/brand_model.dart';
import 'product_attributes_model.dart';
import 'product_variations_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.stock,
    this.sku,
    required this.price,
    required this.title,
    this.date,
    this.salePrice = 0.0,
    required this.thumbnail,
    this.isFeatured,
    this.brand,
    this.description,
    this.categoryId,
    this.images,
    required this.productType,
    this.productAttributes,
    this.productVariations,
  });

  ///Empty function for clean code
  static ProductModel empty() =>
      ProductModel(id: '', stock: 0, price: 0, title: '', thumbnail: '', productType: '');

  /// Json format
  toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand,
      'Description': description,
      'ProductType': productType,
      'ProductAttributes':
          productAttributes != null ? productAttributes!.map((e) => e.toJson()).toList() : [],
      'ProductVariations':
          productVariations != null ? productVariations!.map((e) => e.toJson()).toList() : [],
    };
  }

  /// Map json orientied document snapshot from firebase to model
  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      sku: data['SKU'],
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.tryParse((data['Price']).toString()) ?? 0.0,
      salePrice: double.tryParse((data['SalePrice']).toString()) ?? 0.0,
      title: data['Title'],
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'],
      productType: data['ProductType'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    );
  }

  // /// Map Json Orientied Document snapshot from firebase to model
  // //TODO  Need to UPDATE THIS
  // factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
  //   final data = document.data() as Map<String, dynamic>;
  //   return ProductModel(
  //     id: document.id,
  //     sku: data['SKU'],
  //     stock: data['Stock'] ?? 0,
  //     isFeatured: data['IsFeatured'] ?? false,
  //     price: double.parse((data['Price'] ?? 0.0).toString()),
  //     salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
  //     title: data['Title'],
  //     thumbnail: data['Thumbnail'] ?? '',
  //     categoryId: data['CategotyId'] ?? '',
  //     description: data['Description'],
  //     productType: data['ProductType'] ?? '',
  //     brand: BrandModel.fromJson(data['Brand']),
  //     images: data['Images'] != null ? List<String>.from(data['Images']) : [],
  //     productAttributes: (data['ProductAttributes'] as List<dynamic>)
  //         .map((e) => ProductAttributeModel.fromJson(e))
  //         .toList(),
  //     productVariations: (data['ProductVariations'] as List<dynamic>)
  //         .map((e) => ProductVariationModel.fromJson(e))
  //         .toList(),
  //   );
  // }
}
