import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: TextField(controller: controller),
      actions: [
        IconButton(onPressed: (){
          final name = controller.text;
          createUser(name : name);

        }, icon: Icon(Icons.add))
      ],

      ),
      body: StreamBuilder<List<User>>(
        stream: readUsers(),
        builder: (context, snapshot){
          if(snapshot.hasError){
       return Text('something went wrong! ${snapshot.error}' );

          }

          else if(snapshot.hasData){
            final users= snapshot.data!;
            return ListView(
              children: users.map(buildUser).toList()
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
  leading: CircleAvatar(
    child: Text('${user.age}'),
  ),
  title: Text(user.name),
  subtitle: Text(user.birthday.toIso8601String()),
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

