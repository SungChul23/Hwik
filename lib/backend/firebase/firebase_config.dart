import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA8B-Z-zNUzo4uZbi8T7DXPb1YSYLz4YoM",
            authDomain: "lambdasquirrel-5c4b4.firebaseapp.com",
            projectId: "lambdasquirrel-5c4b4",
            storageBucket: "lambdasquirrel-5c4b4.firebasestorage.app",
            messagingSenderId: "599071636407",
            appId: "1:599071636407:web:978d49e0da0db84f108632",
            measurementId: "G-1Q39CJNHSM"));
  } else {
    await Firebase.initializeApp();
  }
}
