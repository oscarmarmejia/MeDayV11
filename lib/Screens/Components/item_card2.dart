import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants.dart';
import '../../Last/favorite_last_test_DB.dart';
import '../../Models/user.dart';
import 'body.dart';


class ItemCard2 extends StatefulWidget {
  final User user;
  final VoidCallback press;
  const ItemCard2({Key? key, required this.user, required this.press}) : super(key: key);

  @override
  State<ItemCard2> createState() => _ItemCard2State();
}

class _ItemCard2State extends State<ItemCard2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   // Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('user').snapshots();
    return GestureDetector(
      onTap: widget.press,
      child: Column(
        children: <Widget> [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5),
              height: 180,
              width: 160,
              decoration: BoxDecoration(

                color: Color.fromRGBO(widget.user.color1, widget.user.color2, widget.user.color3, widget.user.colorOp),
                //Color.fromRGBO(widget.user.color1, widget.user.color1, widget.user.color1, widget.user.colorOp),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(60),),
                      child: Image.network(widget.user.color,)),
                  SizedBox(height: 5.0,),
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
                        SizedBox(height: size.height* 0.05,
                          child: FavoriteButton(


                            isFavorite: widget.user.favorite,



                            valueChanged: (_isFavorite) {
                              final docUser = FirebaseFirestore.instance.collection('prueba1').doc(widget.user.id);
                              final docUser2 = FirebaseFirestore.instance.collection('favoritos').doc(widget.user.id);
                              if(widget.user.favorite){
                                docUser2.delete();
                                docUser.update({

                                  'favorite' : false,
                                });
                              }
                              else{
                                createUser2();
                                docUser.update({

                                  'favorite' : true,
                                });
                              }
                              print('Is Favorite : $_isFavorite');
                            },),
/*
                          child: Stack(
                                alignment: Alignment.center,
                            children:<Widget>[

                              Icon(Icons.favorite, size: 43, color: Color.fromRGBO(10, 10, 10, 0.9) ,),

                              Positioned(
                                right: 43,
                                bottom: 1,
                                child: Checkbox(
                                  checkColor: Colors.red,

                                  activeColor: Colors.red,
                                  shape: CircleBorder(),
                                  value: widget.user.favorite,
                                onChanged: (newBool) {


                                  var docUser = FirebaseFirestore.instance.collection('prueba1').doc('${widget.user.age}');
                                  docUser.update({

                                    'favorite' : newBool,
                                  });
                                },),
                              ),

                              Positioned(
                                left: 43,
                                bottom: 1,
                                child: Checkbox(
                                  checkColor: Colors.red,

                                  activeColor: Colors.red,
                                  shape: CircleBorder(),
                                  value: widget.user.favorite,
                                  onChanged: (newBool) {


                                    var docUser = FirebaseFirestore.instance.collection('prueba1').doc('${widget.user.age}');
                                    docUser.update({

                                      'favorite' : newBool,
                                    });
                                  },),
                              ),

                              Positioned(

                                top: 1,
                                child: Checkbox(

                                  checkColor: Colors.red,
                                  activeColor: Colors.red,
                                  shape: CircleBorder(),
                                  value: widget.user.favorite,
                                  onChanged: (newBool) {


                                    var docUser = FirebaseFirestore.instance.collection('prueba1').doc('${widget.user.age}');
                                    docUser.update({

                                      'favorite' : newBool,
                                    });
                                  },),
                              ),

                              Positioned(

                                right:47,
                                child: Checkbox(

                                  checkColor: Colors.red,
                                  activeColor: Colors.red,
                                  shape: CircleBorder(),
                                  value: widget.user.favorite,
                                  onChanged: (newBool) {


                                    var docUser = FirebaseFirestore.instance.collection('prueba1').doc('${widget.user.age}');
                                    docUser.update({

                                      'favorite' : newBool,
                                    });
                                  },),
                              ),

                              Positioned(

                                left:47,
                                child: Checkbox(

                                  checkColor: Colors.red,
                                  activeColor: Colors.red,
                                  shape: CircleBorder(),
                                  value: widget.user.favorite,
                                  onChanged: (newBool) {


                                    var docUser = FirebaseFirestore.instance.collection('prueba1').doc('${widget.user.age}');
                                    docUser.update({

                                      'favorite' : newBool,
                                    });



                                  },),
                              ),




                              //Icon(Icons.favorite_border, size: 37, color: Color.fromRGBO(widget.user.color1, widget.user.color2, widget.user.color3, widget.user.colorOp),),
    ],

                          ),



 */





                          
                          
                          

                          
                        ),
                      ],
                    );


                    //Text("test ${data.docs[1]['name']}");

                  }),

                ],
              ),

              ),
          ),

         /*
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin /4),

          ),


          Text(
            "${widget.user.name}", style: TextStyle(fontWeight: FontWeight.bold),
          ),


          */





        ],
      ),
    );
  }

  Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('user').snapshots();

  Future createUser2() async{

    final docUser = FirebaseFirestore.instance.collection('favoritos').doc('${widget.user.age}');

    final json = {
      "id" : docUser.id,
      "name": widget.user.name,
      "age": 21,
      "birthday" : DateTime(2001, 7, 28),
      "favorite" : true,
      "color1" : widget.user.color1,
      "color2" : widget.user.color2,
      "color3" : widget.user.color3,
      "color" : widget.user.color,
      "colorOp" : widget.user.colorOp,
      "description" : "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
"color4" : widget.user.color4,
      "urlimage" : widget.user.urlimage,
    };

    await docUser.set(json);
  }


}

