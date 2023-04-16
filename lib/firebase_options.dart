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
    apiKey: 'AIzaSyAaC_qMi11xRQUhvyC-AwTeUuQZQY-9Ij8',
    appId: '1:828682374499:web:fea9f350978f87ab0cd756',
    messagingSenderId: '828682374499',
    projectId: 'heirrand-4a31a',
    authDomain: 'clair-52652.firebaseapp.com',
      databaseURL: 'https://heirrand-4a31a.firebaseio.com',
    storageBucket: "heirrand-4a31a.appspot.com",
      measurementId: "G-Y9X1K44FS6"
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAaC_qMi11xRQUhvyC-AwTeUuQZQY-9Ij8',
    appId: '1:828682374499:android:3e0704f06a7f9fa80cd756',
    messagingSenderId: '828682374499',
    projectId: 'heirrand-4a31a',
    databaseURL: 'https://heirrand-4a31a.firebaseio.com',
    storageBucket: 'heirrand-4a31a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAaC_qMi11xRQUhvyC-AwTeUuQZQY-9Ij8',
    appId: '1:828682374499:ios:6faf5d5e6a2771120cd756',
    messagingSenderId: '828682374499',
    projectId: 'heirrand-4a31a',
    databaseURL: 'https://heirrand-4a31a.firebaseio.com',
    storageBucket: 'heirrand-4a31a.appspot.com',
    androidClientId: '828682374499-4cjjjhl3c9mejcdpq6san4mauca59acn.apps.googleusercontent.com',
    iosClientId: '828682374499-10cd1jefphebkp5pjdj1nmvfktkb7vra.apps.googleusercontent.com',
    iosBundleId: 'com.nnewitech.heirrand',
  );
}