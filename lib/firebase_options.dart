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
    apiKey: 'AIzaSyC_kiEQ0zW28WahA9QizO8pfTI2Hh5ep-w',
    appId: '1:943369872612:web:6ee1a287af62ed31ff38f1',
    messagingSenderId: '943369872612',
    projectId: 'myapplogin-4f3df',
    authDomain: 'myapplogin-4f3df.firebaseapp.com',
    storageBucket: 'myapplogin-4f3df.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDpww0aa3W0sQd7JoNLZfBLiMNrqUicogY',
    appId: '1:943369872612:android:a9a5fc095387c7d8ff38f1',
    messagingSenderId: '943369872612',
    projectId: 'myapplogin-4f3df',
    storageBucket: 'myapplogin-4f3df.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_LbiXZ_aomlAwMgdW6o_7s7nc0lTWs1s',
    appId: '1:943369872612:ios:b6412327de11487bff38f1',
    messagingSenderId: '943369872612',
    projectId: 'myapplogin-4f3df',
    storageBucket: 'myapplogin-4f3df.appspot.com',
    iosClientId: '943369872612-a7b03dhl57prpdtmb2vorfsj6n8bkj65.apps.googleusercontent.com',
    iosBundleId: 'mis.codigos.myAppLogin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD_LbiXZ_aomlAwMgdW6o_7s7nc0lTWs1s',
    appId: '1:943369872612:ios:b6412327de11487bff38f1',
    messagingSenderId: '943369872612',
    projectId: 'myapplogin-4f3df',
    storageBucket: 'myapplogin-4f3df.appspot.com',
    iosClientId: '943369872612-a7b03dhl57prpdtmb2vorfsj6n8bkj65.apps.googleusercontent.com',
    iosBundleId: 'mis.codigos.myAppLogin',
  );
}