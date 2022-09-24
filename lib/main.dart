import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:medayv11/Last/main_screen.dart';
import 'package:medayv11/Models/Product.dart';
import 'package:medayv11/Screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medayv11/Screens/test_login.dart';

import 'Screens/favorites_list.dart';


Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
   // runApp( MyApp());
   runApp( MyApp());
}

class GoogleSignInApp extends StatefulWidget {
  const GoogleSignInApp({Key? key}) : super(key: key);

  @override
  State<GoogleSignInApp> createState() => _GoogleSignInAppState();
}

class _GoogleSignInAppState extends State<GoogleSignInApp> {

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;

    return MaterialApp(
      home:Scaffold(
        appBar:  AppBar(title: Text('Google Sign In (Sign '+ (user == null  ?  'out': 'in' ) + ")" ),

      ),
        body:  Center(
          child: Column(
            children: [
              ElevatedButton(child: Text("Sign in") ,onPressed:  user != null ? null :() async {
                await _googleSignIn.signIn();

               Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));

              } ),
              ElevatedButton(child: Text("Sign out"), onPressed: user == null ? null :() async{
                await _googleSignIn.signOut();
                setState(() {

                });

              }),
            ElevatedButton(onPressed: (){}, child: Text('Welcome '+ (user == null  ?  'out': user.displayName.toString() ) )),



            ],

          ),

        ),

    )
    );
  }
}




class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp= Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'My Day',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),

      home:FutureBuilder(
                         future: _fbApp,
                          builder: (context, snapshot){
                                          if(snapshot.hasError){
                                                      return Text(
                                                              "someting is wrong");
                                           }
                                          else if (snapshot.hasData){
                                                      return Favorites();
                                                      //return MyHomePage(title: "test");
                                           }
                                          else{
                                                      return Center(
                                                            child: CircularProgressIndicator(),
                );
    }
    },
    ),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({Key? key, required this.title}) : super(key: key);

final CollectionReference productos = FirebaseFirestore.instance.collection('productos');

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    DatabaseReference prueba = FirebaseDatabase.instance.reference().child("test");
    prueba.set("${Random().nextInt(100)}");
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
