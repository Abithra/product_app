import 'package:flutter/material.dart';
import 'package:product_application/presentation/screens/home_screen.dart';
import 'package:product_application/presentation/screens/signin_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'key',
        appId: 'id',
        messagingSenderId: 'sendid',
        projectId: 'myapp',
        storageBucket: 'myapp-b9yt18.appspot.com',
      )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: HomePage(),
    );
  }
}
