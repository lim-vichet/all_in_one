import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'global_use.dart';

class DefaultFirebaseOptions {


  static const FirebaseOptions android = FirebaseOptions(
      apiKey: "AIzaSyDmf5YMxtf_ECM4IfGjYWQ2IyyOZkfRseU",
      appId: "1:981068595271:android:cac54b96c024755e33f162",
      messagingSenderId: "981068595271",
      projectId: "e-customer-dev",
      storageBucket:"e-customer-dev.appspot.com"
  );

  static const FirebaseOptions ios = FirebaseOptions(
      apiKey: "AIzaSyAU3aKulNmdc1VOHCjcunR0exme3pEed38",
      appId: "1:981068595271:ios:3e6c6ac75062e96c33f162",
      messagingSenderId: "981068595271",
      projectId: "e-customer-dev",
      storageBucket:"e-customer-dev.appspot.com"
  );




  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        // targetPlatform = "android";
        return android;
      case TargetPlatform.iOS:
        // targetPlatform = "ios";
        return ios;
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
}