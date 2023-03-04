import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC61rmHTgU0QWq6UZuEBY0nSOWCBNRL-rI",
            authDomain: "pulse-4b296.firebaseapp.com",
            projectId: "pulse-4b296",
            storageBucket: "pulse-4b296.appspot.com",
            messagingSenderId: "321737053235",
            appId: "1:321737053235:web:c72098965771403b01ff46",
            measurementId: "G-NXZ0H7012S"));
  } else {
    await Firebase.initializeApp();
  }
}
