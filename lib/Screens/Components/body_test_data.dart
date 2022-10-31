import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medayv11/Last/favorite_last_test_DB.dart';
import 'package:medayv11/Screens/Details/nueva_fav.dart';

import '../../Constants.dart';
import '../../Models/user.dart';
import 'body.dart';
import 'item_card2.dart';



class BodyTestData extends StatefulWidget {
  const BodyTestData({Key? key}) : super(key: key);

  @override
  State<BodyTestData> createState() => _BodyTestDataState();
}

class _BodyTestDataState extends State<BodyTestData> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body:

      StreamBuilder<List<User>>(

        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('something went wrong! ${snapshot.error}');
          }

          else if (snapshot.hasData) {
            final users = snapshot.data!;
            return

              Column(
                children: [

                  Expanded(


                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: kDefaultPaddin,

                             crossAxisSpacing: kDefaultPaddin,
                          childAspectRatio: 0.68),
                        itemCount: users.length,
                        itemBuilder: (BuildContext context, int index) =>
                            ItemCard2( user : users[index],
                                press: () =>

                                //  Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteLastTestDB(user: users[index])))
                              Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteLastTestDB(user: users[index])))

                            ) ,


                      ),
                    ),
                  ),

                ],
              );
          }

          else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),


    );
  }

  Stream<List<User>> readUsers()
  => FirebaseFirestore.instance.collection('prueba1').snapshots().map((snapshot)
  => snapshot.docs.map((doc)
  => User.fromJson(doc.data())).toList());




}