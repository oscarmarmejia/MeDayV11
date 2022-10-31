import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medayv11/Constants.dart';
import 'package:medayv11/Models/Product.dart';
import 'package:medayv11/Screens/Components/categories.dart';
import 'package:medayv11/Screens/Components/item_card.dart';
import 'package:medayv11/Screens/Details/details_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medayv11/Screens/test_login.dart';
import '../../Last/favorite_last.dart';
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
        /*
        FloatingActionButton(onPressed: () async{
          await _googleSignIn.signOut();
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginTest()));
        }),

         */
        Expanded(
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPaddin,
                //   crossAxisSpacing: kDefaultPaddin,
                childAspectRatio: 0.75),


            itemBuilder: (context, index)=> ItemCard( product : products[index],


                  press: () => Navigator.of(context).push(CustomPageRoute(FavoriteLast(product: products[index])))
               // press: () => Navigator.of(context).push(CustomPageRoute(DetailScreen(product: products[index])))
                   )
            ,)
          ,)


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

class _TransitionListTile extends StatelessWidget {
  const _TransitionListTile({
    this.onTap,
    required this.title,
    required this.subtitle,
  });

  final GestureTapCallback? onTap;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      leading: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.black54,
          ),
        ),
        child: const Icon(
          Icons.play_arrow,
          size: 35,
        ),
      ),
      onTap: onTap,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }


  //Stream<List<User>> readUsers() => FirebaseFirestore.instance.collection('favoritos').snapshots().map((snapshot) => snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());


}

class CustomPageRoute<T> extends PageRoute<T> {
  CustomPageRoute(this.child);
  @override
  // TODO: implement barrierColor
  Color get barrierColor => Colors.white;

  @override
  String? get barrierLabel => null;

  final Widget child;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 1000);
}