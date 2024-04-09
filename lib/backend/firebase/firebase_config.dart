import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAUqXvF96H4rIclelTGNSSc_4DyMGg7KyM",
            authDomain: "flares-cf75c.firebaseapp.com",
            projectId: "flares-cf75c",
            storageBucket: "flares-cf75c.appspot.com",
            messagingSenderId: "589050000203",
            appId: "1:589050000203:web:9197b1698d0a5f15af2ece",
            measurementId: "G-YEMMC7LWXH"));
  } else {
    await Firebase.initializeApp();
  }
}
