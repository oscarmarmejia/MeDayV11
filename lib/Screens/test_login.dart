import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medayv11/Screens/home_screen.dart';
import 'package:medayv11/Screens/test_logout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:medayv11/Models/Product.dart';
import 'package:medayv11/Screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medayv11/Screens/test_login.dart';



class LoginTest extends StatelessWidget {
  const LoginTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );

  }
}

class FirstScreen extends StatelessWidget {
   FirstScreen({Key? key}) : super(key: key);
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;
      return Scaffold(
      appBar: AppBar(
        title: const Text('first Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Google SignIn'),
          onPressed: () async {

            await _googleSignIn.signIn();
  Navigator.push(context, MaterialPageRoute(
      builder: (context) => TestLogout())); // el bueno
   }
        ),

      ),




    );
  }
}


class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Route'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Second route'),
            onPressed: () {

            },
          ),
        ),




    );

  }
}


