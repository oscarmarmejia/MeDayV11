import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medayv11/Last/favorite_last.dart';
import 'package:medayv11/Models/books.dart';
import 'package:medayv11/Screens/Details/details_screen.dart';
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
import 'package:medayv11/main.dart';

import '../Constants.dart';
import '../Models/book_page.dart';



class LoginTest extends StatelessWidget {
  const LoginTest({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LookingScreen(),
    );

  }
}


class LookingScreen extends StatefulWidget {


  const LookingScreen({Key? key}) : super(key: key);

  @override
  State<LookingScreen> createState() => _LookingScreenState();
}


class _LookingScreenState extends State<LookingScreen> {


  @override

  final controller = TextEditingController();

  List books = allBooks;
  Widget build(BuildContext context) {


    return Scaffold(


      body: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10,10, 10),
          child:
          TextField(
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Deals',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color:Colors.blueAccent)
              ),

            ),
            onChanged: searchBook,
          )
          ,
        ),
        Expanded(child: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index){
            final book = books[index];
            return ListTile(
              leading: Image.asset(book.image, fit: BoxFit.cover, width: 50, height: 50,),
              title: Text(book.title),
              onTap: () =>Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavoriteLast(product: products[index],))),

            );

          },
        ),
        )

      ],
      ),
    );




  }

  void searchBook(String query){
    final suggestions = allBooks.where((book) {
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();

      return bookTitle.contains(input);


    }).toList();
    setState(()  => books = suggestions);
  }





}






