import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/auth_service.dart';

class SignInScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            User? user = await _authService.signInWithGoogle();
            if (user != null) {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => HomeScreen(user: user)),
              // );
            }
          },
          child: Text('Sign in with Google'),
        ),
      ),
    );
  }
}