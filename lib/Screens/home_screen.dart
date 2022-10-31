import 'package:flutter/material.dart';
import 'package:medayv11/Constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medayv11/Last/favorite_last_test_DB.dart';
import 'package:medayv11/Screens/Components/body.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medayv11/Screens/Components/body_test_data.dart';
import 'package:medayv11/Screens/Details/nueva_fav.dart';
import 'package:medayv11/Screens/test_login.dart';
import 'package:medayv11/main.dart';
import 'package:bottom_bar_page_transition/bottom_bar_page_transition.dart';
import '../Last/contact.dart';
import '../Models/Product.dart';
import 'Components/search_list.dart';
import 'favorites_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);

  int currentIndex = 0;
  final screens = [
  // BodyTestData(),
    BodyTestData (),
    Favorites(),

    SearchList(),
   // LoginTest(),
    Contact(),









  ];

  @override
Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;
  return Scaffold(
          appBar: PreferredSize(
                  preferredSize: Size.fromHeight(80.0),
                  child: AppBar(
                          backgroundColor: Colors.red,
                          elevation: 10,
                          flexibleSpace: Container(
                                        decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: AssetImage(
                                                              "assets/images/test2.jpg"
                                                          ),
                                                    ),
                                        ),
                          ),
                    leading: IconButton(
                              onPressed: (){},
                              icon: SvgPicture.asset(
                                      "assets/icons/back.svg"
                                     ),
                                    ),

                            ),
                              ),
    body: screens[currentIndex],

    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
     iconSize: 37,

   unselectedItemColor: Colors.white24,
     selectedFontSize: 18,
     unselectedFontSize: 12,
     selectedItemColor: lenaColor2,
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),

                        backgroundColor: lenaColor, items: [
                                                        BottomNavigationBarItem(
                                                          label: "Home",
                                                          icon: Icon(
                                                            Icons.home,

                                                        ),),
      BottomNavigationBarItem(  label: "Favorites", icon: Icon(
          Icons.favorite,

      ),),
      BottomNavigationBarItem(  label: "Search", icon: Icon(
          Icons.search,
      ),),
      BottomNavigationBarItem(  label: "Contact", icon: Icon(
        Icons.contact_support,
      ),),


    ],

                                      ),
                  );
                                  }
}



