import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:medayv11/Constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medayv11/Last/my_search_delegate.dart';
import 'package:medayv11/Screens/Components/body.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medayv11/Screens/test_login.dart';
import 'package:medayv11/main.dart';

import '../Models/Product.dart';
import '../Screens/favorites_list.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentIndex = 0;
  final screens = [
    Body(),
    Favorites(),
    LoginTest()




  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          automaticallyImplyLeading: false,
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
          actions: [
            /*
            IconButton(
                icon: const Icon(Icons.search),
                onPressed: (){
                  showSearch(
                      context: context,
                      delegate: MySearchDelegate());
                }
            )

             */
          ],
        ),
      ),
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 37,
        elevation: 10,
        unselectedItemColor: Colors.white24,
        selectedFontSize: 16,
        unselectedFontSize: 10,
        selectedItemColor: lenaColor2,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),

        backgroundColor: lenaColor, items: [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(
            Icons.home,

          ),),
        BottomNavigationBarItem(  label: "Favorite", icon: Icon(
          Icons.favorite,

        ),),
        BottomNavigationBarItem(  label: "Search", icon: Icon(
          Icons.search,
        ),),


      ],

      ),

    );
  }
}




