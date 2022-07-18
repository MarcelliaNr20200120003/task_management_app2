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
    apiKey: 'AIzaSyB1r9hpb4kAWDeiFEwJ2aDBcFhmwWtcnUY',
    appId: '1:878212850066:web:0a5979522ea239dd42a14b',
    messagingSenderId: '878212850066',
    projectId: 'task-management-apps2',
    authDomain: 'task-management-apps2.firebaseapp.com',
    storageBucket: 'task-management-apps2.appspot.com',
    measurementId: 'G-DVF82W6EPR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBE8roJTkwJMC4Py0zIyJ5PO3YmFsI2ABg',
    appId: '1:878212850066:android:1ded3e4f9a082ad742a14b',
    messagingSenderId: '878212850066',
    projectId: 'task-management-apps2',
    storageBucket: 'task-management-apps2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDTcW6KCp0RmmIqu_15bFwqAU0xWni7aTw',
    appId: '1:878212850066:ios:70b6aaa1f49bce0c42a14b',
    messagingSenderId: '878212850066',
    projectId: 'task-management-apps2',
    storageBucket: 'task-management-apps2.appspot.com',
    androidClientId: '878212850066-ujo18dbsj996ug5903sthpg2vq0pj50r.apps.googleusercontent.com',
    iosClientId: '878212850066-gac5j87u8tnj0qbspnm88eace83r7l11.apps.googleusercontent.com',
    iosBundleId: 'com.example.taskManagementApp2',
  );
}