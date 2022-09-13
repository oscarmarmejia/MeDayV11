import 'package:flutter/material.dart';
import 'package:medayv11/Constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medayv11/Screens/Components/body.dart';

import '../Models/Product.dart';

class HomeScreen extends StatelessWidget {

  @override
Widget build(BuildContext context) {

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
        actions: [
                     IconButton(
                               icon: const Icon(Icons.search),
                              onPressed: (){
                                            showSearch(
                                                context: context,
                                                delegate: MySearchDelegate());
                               }
                               )
                  ],
                            ),
                              ),
    body: Body(),
    bottomNavigationBar: NavigationBar(
                        backgroundColor: lenaColor,
                        destinations: [
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
                                      ],
                                      ),
                  );
                                  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchTerms = [

    /*
    "99 Favor Taste",
    'A&W',
    'Applebees',
    'Arbys',
    'Au Bon Pain',
    "Auntie Anne's",
    "Baja Fresh Mexican Grill",
    "Baskin-Robbins",
    "Bd's Mongolian Grill",
    "Benefit Cosmetics",
    "Benihana",
    "Bertucci's",
    "BJ's Restaurant & Brewhouse",
    "Black Angus Steakhouse",
    "Bojangles",
    "Bonefish Grill",
    "Brueggers Bagels",
    "Bufallo Wild WIngs", "Capital Grille",
    "Carrabba's",
    "Carvel",
    "Checkers",
    "Cheesecake Factory",
    "Chevys Fresh Mex",
    "Chili's",
    "Cold Stone",
    "Corner Bakery Cafe",
    "Cotton Patch Cafe",
    "Cracker Barrel",

    "Dairy Queen",
    "Del Taco",
    "Dickey's Barbecue Pit",
    "Dippin' Dots",
    "Einstein Bros. Bagels",
    "El Pollo Loco",
    "Farmer Boys",
    "Firehouse Subs",
    "Friendly's",
    "GODIVA",
    "Halo Burger",

    "Jack in the Box",
    "Jamba Juice",
    "Jersey Mike's",
    "Jimmy John's",
    "Joe's Crab Shack",
    "Johnny Rockets",
    "Junior's Cheesecake",
    "Krispy Kreme",
    "Margaritaville",
    "Melting Pot",
    "Mimi's Cafe",
    "Moes",
    "Noodles & Company",
    "Nothing Bundt Cakes",
    "O'Charley's",
    "Olive Garden",
    "Orange Leaf",

    "P.F. Chang's",
    "Panera",
    "Papa Gino's",
    "Peet's Coffee & Tea",
    "Pinkberry",
    "Pizza Hut",
    "Red Lobster",
    "Red Robin",
    "Rita's Italian Ice",
    "Rubio's Coastal Grill",
    "Ruby Tuesday",
    "Rusty Bucket Restaurant and Tavern",

    "Sizzler",
    "Snuffer's Restaurant & Bar",
    "Sonny's BBQ",

    "Steak 'n Shake",
    "Taco Cabana",

    "TGI Fridays",
    "The Halal Guys",
    "Uno Pizzeria & Grill",

    "Wetzel's Pretzels",
    "Wienerschnitzel",

    "Zaxby's"


     */
  ];

  @override
  List<Widget>? buildActions(BuildContext context)  {
    return [
      IconButton(onPressed: (){  if(query.isEmpty){
        close(context, null);
      }
      else {
        query = '';}}, icon: const Icon(Icons.clear))

    ];


  }



  @override
  Widget? buildLeading(BuildContext context) {
    return
      IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {close(context, null);  },);
  }


  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text(query, style: const TextStyle(fontSize: 64 ),),);

    /*
    List<String> matchQuery = [];
  for(var fruit in searchTerms){
    if(fruit.toLowerCase().contains(query.toLowerCase())) {
      matchQuery.add(fruit);
    }
  }


  return ListView.builder(
    itemCount: matchQuery.length,
      itemBuilder: (context, index){
      var result = matchQuery[index];
      return ListTile(
        title: Text(result),
      );
      },

  );

     */
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = searchTerms.where((searchTerms) {
      final result = searchTerms.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);

    }).toList();
    /*
    for(var fruit in searchTerms){
      if(fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
*/

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        final matchquery = matchQuery[index];

        return ListTile(title:Text(matchquery), onTap: (){
          query = matchquery;
          showResults(context);
        },);
        /*
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );

     */
      },

    );
  }
}


