import 'package:flutter/material.dart';

import '../../Constants.dart';
import '../../Models/Product.dart';
import '../../Models/user.dart';





class ProductImage2 extends StatelessWidget {
  const ProductImage2({
    Key? key, required this.user,

  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /*
          Text(product.title, style: TextStyle(color:Colors.white),
        ),

           */
          /*
          Text(product.title, style: Theme.of(context).textTheme.headline4?.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),


          ),

           */

          Row(
            mainAxisAlignment : MainAxisAlignment.center,

            children: <Widget>[


              Container( width: 200, height: 200,
                  child: Expanded(child:
                  Image.network(user.color, fit: BoxFit.fill, )
                // child: Expanded(child: Image("assets/images/rest${user.id}.png"), fit: BoxFit.fill,),


                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
