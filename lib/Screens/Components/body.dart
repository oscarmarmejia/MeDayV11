import 'package:flutter/material.dart';
import 'package:medayv11/Constants.dart';
import 'package:medayv11/Models/Product.dart';
import 'package:medayv11/Screens/Components/item_card.dart';
import 'package:medayv11/Screens/Details/details_screen.dart';




class Body extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10,),
        Expanded(
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPaddin,
                //   crossAxisSpacing: kDefaultPaddin,
                childAspectRatio: 0.75),


            itemBuilder: (context, index)=> ItemCard( product : products[index],
                press: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> DetailScreen(product: products[index])))),),)

      ],
    );
  }
}

