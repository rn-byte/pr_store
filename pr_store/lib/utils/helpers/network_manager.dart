import 'dart:async';
import 'dart:ffi';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../popups/loaders.dart';

/// Manages the network connectivity status and provide methods to check and handel connectivity changes
class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  /// Initialize the Network Manager and Set up a Stream to Continuously check
  /// the connection status

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

// Update the connection status based on changes in connectivity and show a
//relevant pop up for no internet connection
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      PrLoaders.warningSnackBar(title: 'No Internet Connection');
    }
  }

  // Check the internet connection  state
  // Return 'true' if connected , 'false' Otherwise

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  // Dispose or close the active connectivity stream
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
