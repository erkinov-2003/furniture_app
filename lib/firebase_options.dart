// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACkEfQe1Lp87lBuEW335z7kZVe3GO_aJw',
    appId: '1:350917919825:android:19479be9aa52f6b9302470',
    messagingSenderId: '350917919825',
    projectId: 'furnitureapp-68e31',
    databaseURL: 'https://furnitureapp-68e31-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'furnitureapp-68e31.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAG2Bq2x9cPOeBjHuKZMEMbC9IlBctH8LQ',
    appId: '1:350917919825:ios:210adeebe63f8931302470',
    messagingSenderId: '350917919825',
    projectId: 'furnitureapp-68e31',
    databaseURL: 'https://furnitureapp-68e31-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'furnitureapp-68e31.appspot.com',
    iosBundleId: 'dev.erkinov.furnitureApp',
  );
}