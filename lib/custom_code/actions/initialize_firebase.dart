// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show kIsWeb, defaultTargetPlatform, TargetPlatform;

Future<void> initializeFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: _getFirebaseOptions(),
  );
}

FirebaseOptions _getFirebaseOptions() {
  if (kIsWeb) {
    return FirebaseOptions(
      apiKey: 'AIzaSyDax2M0r15rC8eHNPTsfyCWs5zEBh0xw3s',
      appId: '1:589050000203:android:9676cfcc4bb1ee80af2ece',
      messagingSenderId: '589050000203',
      projectId: 'flares-cf75c',
      storageBucket: 'flares-cf75c.appspot.com',
    );
  }
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      return FirebaseOptions(
        apiKey: 'AIzaSyDax2M0r15rC8eHNPTsfyCWs5zEBh0xw3s',
        appId: '1:589050000203:android:9676cfcc4bb1ee80af2ece',
        messagingSenderId: '589050000203',
        projectId: 'flares-cf75c',
        storageBucket: 'flares-cf75c.appspot.com',
      );
    case TargetPlatform.iOS:
      return FirebaseOptions(
        apiKey: 'AIzaSyAKyb5J9TMH0eIRpO_NS7lA5kuE6JwjBdU',
        appId: '1:589050000203:ios:c3df451e7f75cbceaf2ece',
        messagingSenderId: '589050000203',
        projectId: 'flares-cf75c',
        storageBucket: 'flares-cf75c.appspot.com',
        iosBundleId: 'com.flares',
      );
    default:
      throw UnsupportedError(
        'FirebaseOptions are not supported for this platform.',
      );
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
