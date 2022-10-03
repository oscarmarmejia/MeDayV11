
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Constants.dart';
import '../Models/Product.dart';
import '../Models/user.dart';
import '../Screens/Components/ProductImage.dart';
import '../Screens/Components/ProductImage2.dart';






class FavoriteLast2 extends StatefulWidget {

  final User user;

  const FavoriteLast2({Key? key, required this.user}) : super(key: key);

  @override
  State<FavoriteLast2> createState() => _FavoriteLast2State();
}

class _FavoriteLast2State extends State<FavoriteLast2> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(


      appBar: AppBar(
        backgroundColor:  Colors.transparent,

        elevation: 0,
        leading: IconButton(icon: SvgPicture.asset(
          'assets/icons/back.svg', color: Colors.white,),
          onPressed: () => Navigator.pop(context),
        ),

      ),
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height ,
              child: Stack(
                fit: StackFit.loose,
                children:<Widget> [

                  //ProductImage2(user : users),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.35 ),
                    padding: EdgeInsets.only(top: size.height * 0.2, left: kDefaultPaddin, right: kDefaultPaddin),
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                       // Description(product: widget.product),

                      ],
                    )
                    ,
                  ),
                  StreamBuilder<QuerySnapshot>(stream: users, builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot,){

                    if(snapshot.hasError){
                      return Text('Something is wrong');
                    }
                    else if(snapshot.connectionState == ConnectionState.waiting){
                      return Text("loading");
                    }

                    final data = snapshot.requireData;
                    return Column(

                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: size.height* 0.95,

                        ),
                      ],
                    );


                    //Text("test ${data.docs[1]['name']}");

                  }),
                  /*
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
                            SizedBox(height: 450),
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


                   */

                  Positioned(
                    left: MediaQuery.of(context).size.width/6,
                    top: MediaQuery.of(context).size.height/1.5,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(50),
                      child: TextButton(child:
                      Text(
                        "go for the deallll!",
                        style: TextStyle(fontSize: 15),
                      ),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.deepOrangeAccent)))

                        ),

                        onPressed: () async =>{

                        //  await launch(widget.product.url)

                        },





                      ),


                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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

/*
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


 */
  Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('user').snapshots();

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

  Future createUser2({required String name}) async{

    final docUser = FirebaseFirestore.instance.collection('favoritos').doc();

    final json = {
      "id" : docUser.id,
      "name": "",
      "age": 21,
      "birthday" : DateTime(2001, 7, 28),
      "favorite" : true,

    };

    await docUser.set(json);
  }



}


class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(product.description, style: TextStyle(height: 1.5 ),),
    );
  }
}
