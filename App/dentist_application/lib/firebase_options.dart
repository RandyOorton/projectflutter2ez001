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
        return macos;
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
    apiKey: 'AIzaSyCTfgsd2nloTzQw9ISnOjvfBHi92f4E0is',
    appId: '1:870120609424:web:b7453e0fd651ea4c8fea15',
    messagingSenderId: '870120609424',
    projectId: 'dentist-application-64a5e',
    authDomain: 'dentist-application-64a5e.firebaseapp.com',
    storageBucket: 'dentist-application-64a5e.appspot.com',
    measurementId: 'G-M9443YDQN5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrf8-b0CZB5dzb9UwMShdwqkxx1-6Cw38',
    appId: '1:870120609424:android:99954021fe3c3d858fea15',
    messagingSenderId: '870120609424',
    projectId: 'dentist-application-64a5e',
    storageBucket: 'dentist-application-64a5e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDIiMi65-t4TPAbmZAxM7IY2MoT3PCjpM4',
    appId: '1:870120609424:ios:dd9adc1f9def4d278fea15',
    messagingSenderId: '870120609424',
    projectId: 'dentist-application-64a5e',
    storageBucket: 'dentist-application-64a5e.appspot.com',
    iosClientId: '870120609424-iok0qf2urdumpo5qvttutqkvpvp0lna7.apps.googleusercontent.com',
    iosBundleId: 'com.example.dentistApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDIiMi65-t4TPAbmZAxM7IY2MoT3PCjpM4',
    appId: '1:870120609424:ios:d20975fe2a87bf368fea15',
    messagingSenderId: '870120609424',
    projectId: 'dentist-application-64a5e',
    storageBucket: 'dentist-application-64a5e.appspot.com',
    iosClientId: '870120609424-vpb6pq3a9qnc5aijio4vgph388pgrftb.apps.googleusercontent.com',
    iosBundleId: 'com.example.dentistApplication.RunnerTests',
  );
}
