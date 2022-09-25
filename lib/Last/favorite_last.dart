import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

import '../Models/Product.dart';
import '../Models/user.dart';


class FavoriteLast extends StatefulWidget {

  final Product product;
  const FavoriteLast({Key? key, required this.product}) : super(key: key);

  @override
  State<FavoriteLast> createState() => _FavoriteLastState();
}

class _FavoriteLastState extends State<FavoriteLast> {
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(

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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 400),
                  Container(
                    width: 400,
                    height: 400,
                    child: ListView(
                        children: users.map(botono).toList()
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
    leading: FavoriteButton(
      isFavorite: ( user.favorite)  ,
      // iconDisabledColor: Colors.white,
      valueChanged: (_isFavorite) {
        final docUser = FirebaseFirestore.instance.collection('user').doc('my-id');
        if(user.favorite){
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

        print('Is Favorite : $_isFavorite');
      },
    ),


    title: Text(user.name),
    subtitle: Text(user.birthday.toIso8601String()),
  );


  Widget botono(User user) => Container(
    child: FavoriteButton(
      isFavorite: ( user.favorite)  ,
      // iconDisabledColor: Colors.white,
      valueChanged: (_isFavorite) {
        final docUser = FirebaseFirestore.instance.collection('user').doc('my-id');
        if(user.favorite){
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

        print('Is Favorite : $_isFavorite');
      },
    ),
  );




  Stream<List<User>> readUsers() => FirebaseFirestore.instance.collection('user').snapshots().map((snapshot) => snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  Future createUser({required String name}) async{

    final docUser = FirebaseFirestore.instance.collection('user').doc();

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

