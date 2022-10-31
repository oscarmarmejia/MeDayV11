import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:medayv11/Screens/Components/body.dart';

import '../Last/favorite_last.dart';
import '../Last/favorite_last2.dart';
import '../Last/favorite_last22.dart';
import '../Models/Product.dart';
import '../Models/user.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body:

      StreamBuilder<List<User>>(

        stream: readUsers(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Text('something went wrong! ${snapshot.error}' );

          }

          else if(snapshot.hasData){

            final users= snapshot.data!;
            return

              Column(
                children: [
                  Container(
                    width: 400,
                    height: 569,

                    child: ListView(
                        children: users.map(buildUser).toList()
                    ),
                  ),

                ],
              );
          }

          else{
            return Center(child: CircularProgressIndicator());

          }



        },
      ),


    );
  }

  Widget buildUser(User user) => ListTile(

    leading:

    Image.network(user.color,height: 50, width: 50,  ),  // formato imagenes

   onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteLast22(user: user,))),

    trailing: IconButton(


      icon: Icon(Icons.delete), onPressed: () {

        final docUser2 = FirebaseFirestore.instance.collection('favoritos').doc('${user.id}');

      final docUser = FirebaseFirestore.instance.collection('prueba1').doc('${user.id}');
      if(user.favorite){
        docUser2.delete();
        docUser.update({
          'name' : 'prueba1',
          'favorite' : false,
        });
      }
      else{
        docUser.update({
          'name' : 'prueba2',
          'favorite' : true,
        });
      }






    },
    ),








    title: Text(user.name),
    //subtitle: Text(user.birthday.toIso8601String()),
  );

  Widget favoo(User user) => Container(
      child: Text(user.birthday.toIso8601String())

  );





  Stream<List<User>> readUsers() => FirebaseFirestore.instance.collection('favoritos').snapshots().map((snapshot) => snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  Future createUser({required String name}) async{

    final docUser = FirebaseFirestore.instance.collection('user').doc('2');

    final json = {
      "id" : docUser.id,
      "name": name,
      "age": 21,
      "birthday" : DateTime(2001, 7, 28),
      "favorite" : false,

    };

    await docUser.set(json);
  }
}
