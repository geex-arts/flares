import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAhOSI9i5tqa72MQUPDGUlmtdW7tL6s6BE",
            authDomain: "eday-7c14d.firebaseapp.com",
            projectId: "eday-7c14d",
            storageBucket: "eday-7c14d.appspot.com",
            messagingSenderId: "949217339794",
            appId: "1:949217339794:web:64f549a28542fe904ef94b",
            measurementId: "G-7E24M5VZB6"));
  } else {
    await Firebase.initializeApp();
  }
}
