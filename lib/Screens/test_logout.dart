import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medayv11/Screens/test_login.dart';
import 'package:medayv11/Screens/test_logout.dart';

class TestLogout extends StatefulWidget {
  const TestLogout({Key? key}) : super(key: key);

  @override
  State<TestLogout> createState() => _TestLogoutState();
}

class _TestLogoutState extends State<TestLogout> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("test2")),

          body: TextButton(onPressed: () async {
            await _googleSignIn.signOut();


              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginTest()));


          }, child: Container(width: 50, height: 50, color: Colors.blue, ),),


        )
    );

  }
}
