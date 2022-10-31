import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:medayv11/Constants.dart';
import 'package:medayv11/Models/Product.dart';
import 'package:favorite_button/favorite_button.dart';


class ItemCard extends StatefulWidget {
  final Product product;
  final VoidCallback press;
  const ItemCard({
    Key? key, required this.product, required this.press,
  }) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('user').snapshots();
    return GestureDetector(
      onTap: widget.press,
      child: Column(
        children: <Widget> [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              height: 180,
              width: 160,
              decoration: BoxDecoration(color: widget.product.color, borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(widget.product.image)
              ,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin /4),

          ),
          Text(
            "${widget.product.title}", style: TextStyle(fontWeight: FontWeight.bold),
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
                SizedBox(height: size.height* 0.05,
                  child: FavoriteButton(


                    isFavorite: data.docs[widget.product.id]['favorite'],



                    valueChanged: (_isFavorite) {
                      final docUser = FirebaseFirestore.instance.collection('user').doc('${widget.product.id}');
                      final docUser2 = FirebaseFirestore.instance.collection('favoritos').doc('${widget.product.id}');
                      if(data.docs[widget.product.id]['favorite']){
                       docUser2.delete();
                        docUser.update({
                          'name' : 'prueba1',
                          'favorite' : false,
                        });
                      }
                      else{
                        createUser2(name: widget.product.title);
                        docUser.update({
                          'name' : 'prueba2',
                          'favorite' : true,
                        });
                      }
                      print('Is Favorite : $_isFavorite');
                    },),
                ),
              ],
            );


            //Text("test ${data.docs[1]['name']}");

          }),

        ],
      ),
    );
  }
  Future createUser2({required String name}) async{

    final docUser = FirebaseFirestore.instance.collection('favoritos').doc('${widget.product.id}');

    final json = {
      "id" : docUser.id,
      "name": widget.product.title,
      "age": 21,
      "birthday" : DateTime(2001, 7, 28),
      "favorite" : true,
      "color1" : widget.product.color1,
      "color2" : widget.product.color2,
      "color3" : widget.product.color3,
      "color" : "prueba",
     "description" : "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley."

    };

    await docUser.set(json);
  }
}
