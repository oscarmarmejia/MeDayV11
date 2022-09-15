import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medayv11/Constants.dart';
import 'package:medayv11/Models/Product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_core/firebase_core.dart';
import '../Components/ProductImage.dart';
import 'dart:math';
import 'package:favorite_button/favorite_button.dart';

class BodyCard extends StatelessWidget {



  final Product product;




  const BodyCard({Key? key, required this. product}) : super(key: key);
  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
                 SizedBox(
                   height: size.height * 0.8,
                   child: Stack(
                     fit: StackFit.loose,
                     children: <Widget>[
                       Container(
                         margin: EdgeInsets.only(top: size.height * 0.3 ),
                         padding: EdgeInsets.only(top: size.height * 0.01, left: kDefaultPaddin, right: kDefaultPaddin),
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
                                    Description(product: product),

                    ],
                  ),
                ),

                                    Positioned(
                                        bottom: 160,
                                        right: 40,
                                        left: 40,

                                        child:

                                    Center(

                                        child:FavoriteButton(

                                          isFavorite: true,


                                          // iconDisabledColor: Colors.white,
                                          valueChanged: (_isFavorite) {
                                            DatabaseReference prueba = FirebaseDatabase.instance.reference().child("test2");
                                           if(_isFavorite){
                                             prueba.set(true);
                                           }
                                           else{
                                             prueba.set(false);
                                           }


                                            print('Is Favorite : $_isFavorite');
                                          },
                                        ),

                                    )),
                                      /*
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        constraints: BoxConstraints.tightForFinite(width: 800, height: 600),
                                          child: RatingBar.builder(
                                              minRating: 1, itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber), onRatingUpdate: (rating){})

                ),
                */





                       Positioned(
                                        left: MediaQuery.of(context).size.width/6,
                                        top: MediaQuery.of(context).size.height/1.7,
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

                        await launch(product.url)

                      },





                    ),
                  ),
                ),
                      ProductImage(product: product),
              ],
            ),
          )



        ],
      ),
    );
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
