// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCijSYvGiiJcqWTYomAjAUvJqHZJQ8NBN4',
    appId: '1:406675356131:web:eb5970b57b13d7903648d6',
    messagingSenderId: '406675356131',
    projectId: 'ecommerce-pr-store',
    authDomain: 'ecommerce-pr-store.firebaseapp.com',
    storageBucket: 'ecommerce-pr-store.appspot.com',
    measurementId: 'G-K4095HFR9N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBHJFO6Xl6TKDK5VQRrD7mGjnT1O_894KQ',
    appId: '1:406675356131:android:9278161631e5cbab3648d6',
    messagingSenderId: '406675356131',
    projectId: 'ecommerce-pr-store',
    storageBucket: 'ecommerce-pr-store.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZxLcxH_IFYi2oC1pMtyuSFPVdp8sR01M',
    appId: '1:406675356131:ios:8e528d7b14e7f2533648d6',
    messagingSenderId: '406675356131',
    projectId: 'ecommerce-pr-store',
    storageBucket: 'ecommerce-pr-store.appspot.com',
    androidClientId: '406675356131-qb20u6evdg5ejv4rupg7u7bm5tcpf986.apps.googleusercontent.com',
    iosClientId: '406675356131-iao6sgko0vl57msdme1nng24snscgv4b.apps.googleusercontent.com',
    iosBundleId: 'com.example.prStore',
  );

}