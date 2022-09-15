import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../Models/Product.dart';

class DetailsItems extends StatefulWidget {

  final Product product;
  const DetailsItems({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailsItems> createState() => _DetailsItemsState();
}

class _DetailsItemsState extends State<DetailsItems> {

  final CollectionReference _productos =
  FirebaseFirestore.instance.collection('products');


  @override
  Widget build(BuildContext context) {
return Container();


  }
}