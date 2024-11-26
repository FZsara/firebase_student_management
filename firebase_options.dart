
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
      apiKey: 'AIzaSyBVOV8gBLfsSjh_9YmbtfDBQbAdczpHfJU',
      appId: '1:627543658267:android:a54a8e897a550dc1664dbe',
      messagingSenderId: '627543658267',
      projectId: 'student-management-app-a15fa',
      storageBucket: 'student-management-app-a15fa.firebasestorage.app',
      databaseURL:
          'https://student-management-app-a15fa-default-rtdb.firebaseio.com/');

  static const FirebaseOptions ios = FirebaseOptions(
      apiKey: 'AIzaSyBVOV8gBLfsSjh_9YmbtfDBQbAdczpHfJU',
      appId: '1:627543658267:android:a54a8e897a550dc1664dbe',
      messagingSenderId: '627543658267',
      projectId: 'student-management-app-a15fa',
      storageBucket: 'student-management-app-a15fa.firebasestorage.app',
      iosBundleId: 'com.myapp.firebase_note_app_realtime_db',
      databaseURL:
          'https://student-management-app-a15fa-default-rtdb.firebaseio.com/');
}