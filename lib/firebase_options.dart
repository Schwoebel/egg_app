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
    apiKey: 'AIzaSyD81WiBXKS9ge9PJAwAlAr1M88qxEiBfUs',
    appId: '1:113355040910:web:8575a5d8c40e186cc5c1df',
    messagingSenderId: '113355040910',
    projectId: 'silverspin-egg-app',
    authDomain: 'silverspin-egg-app.firebaseapp.com',
    databaseURL: 'https://silverspin-egg-app-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'silverspin-egg-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBGLs5s6gv6hmS2nzIRM9-jn5UEXSY8o58',
    appId: '1:113355040910:android:34c7fcdde9f78e44c5c1df',
    messagingSenderId: '113355040910',
    projectId: 'silverspin-egg-app',
    databaseURL: 'https://silverspin-egg-app-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'silverspin-egg-app.appspot.com',
  );
}
