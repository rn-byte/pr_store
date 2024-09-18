import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PrFirebaseStorageService extends GetxController {
  static PrFirebaseStorageService get instance => Get.find();

  /// Variable
  final _firebaseStorage = FirebaseStorage.instance;

  /// Upload local Assets from IDE
  ///  Return a Uint8List containing Image data
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      /// Handel exception gracefully
      throw 'Error loading image data :  $e';
    }
  }

  /// Upload image using ImageData on Cloud Firebase storage
  /// Return the download url of the uploaded image
  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      /// Handle exception gracefully
      if (e is FirebaseException) {
        throw 'Firebase Exception: ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error : ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception : ${e.message}';
      } else {
        throw 'Something went wrong. Please try again !';
      }
    }
  }

  /// Upload  Image on Cloud Firebase storage
  /// Return the download url of the uploaded image
  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      /// Handle exception gracefully
      if (e is FirebaseException) {
        throw 'Firebase Exception: ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error : ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception : ${e.message}';
      } else {
        throw 'Something went wrong. Please try again !';
      }
    }
  }
}
