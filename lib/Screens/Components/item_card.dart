import 'package:flutter/material.dart';
import 'package:medayv11/Constants.dart';
import 'package:medayv11/Models/Product.dart';


class ItemCard extends StatelessWidget {
  final Product product;
  final VoidCallback press;
  const ItemCard({
    Key? key, required this.product, required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: <Widget> [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              height: 180,
              width: 160,
              decoration: BoxDecoration(color: product.color, borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(product.image)
              ,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin /4),

          ),
          Text(
            "${product.title}", style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
