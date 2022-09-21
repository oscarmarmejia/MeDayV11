import 'package:flutter/material.dart';
import 'package:medayv11/Constants.dart';
import 'package:medayv11/Models/Product.dart';
import 'package:medayv11/Screens/Components/item_card.dart';
import 'package:medayv11/Screens/Details/details_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Details/details_item.dart';
import 'package:medayv11/main.dart';





class Body extends StatelessWidget {

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
     
        SizedBox(height: 10,),
        FloatingActionButton(onPressed: () async{
          await _googleSignIn.signOut();
          Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleSignInApp()));
        }),
        Expanded(
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPaddin,
                //   crossAxisSpacing: kDefaultPaddin,
                childAspectRatio: 0.75),


            itemBuilder: (context, index)=> ItemCard( product : products[index],
                press: () => Navigator.push(context, MaterialPageRoute(

                   builder: (context)=> DetailScreen(product: products[index])))),),)


      ],
    );
  }
}
/*
class BarraAbajo extends StatefulWidget {
  const BarraAbajo({Key? key}) : super(key: key);

  @override
  State<BarraAbajo> createState() => _BarraAbajoState();
}

class _BarraAbajoState extends State<BarraAbajo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar:BottomNavigationBar(
        backgroundColor: lenaColor, items: [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(color: lenaColor2,
            Icons.home,

          ),),
        BottomNavigationBarItem(  label: "favorite", icon: Icon(color: lenaColor2,
          Icons.favorite,

        ),),
        BottomNavigationBarItem(  label: "Exit", icon: Icon(color: lenaColor2,
          Icons.exit_to_app,
        ),),


      ],
        /*  destinations: [

                                        NavigationDestination(

                                                              label: "Home",
                                                               icon: Icon(
                                                                    Icons.home,
                                                                   color: lenaColor2
                                                                          ),
                                                              ),
                                         NavigationDestination(
                                                              label: "saved",
                                                              icon: Icon(
                                                                Icons.favorite,
                                                                color: lenaColor2,
                                                                         )
                                                               ),
                                        NavigationDestination(
                                                              label: "search",
                                                              icon: Icon(
                                                                Icons.search,
                                                                color: lenaColor2,
                                                                        )
                                                              ),
                                        NavigationDestination(

                                                              label: "more",
                                                              icon: Icon(
                                                                Icons.more_horiz,
                                                                color: lenaColor2,
                                                                        )
                                                             ),

                          \
                                      ], */
      ),
    );
  }
}


 */

