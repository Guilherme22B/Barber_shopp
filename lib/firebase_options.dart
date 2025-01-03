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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDyRFLD0dfsO3bDZG2CVmn_6ajDVCGFINQ',
    appId: '1:342615151960:web:05b87338f3ec168634c12d',
    messagingSenderId: '342615151960',
    projectId: 'barber-shopp-eeb35',
    authDomain: 'barber-shopp-eeb35.firebaseapp.com',
    storageBucket: 'barber-shopp-eeb35.firebasestorage.app',
    measurementId: 'G-PG325P72MB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVEyUKc4P-ylJMgLVSoiin_xFUHTLTog8',
    appId: '1:342615151960:android:fa93cd1e47367ceb34c12d',
    messagingSenderId: '342615151960',
    projectId: 'barber-shopp-eeb35',
    storageBucket: 'barber-shopp-eeb35.firebasestorage.app',
  );

}