import 'package:flutter/material.dart';


class Product {
  final String image, title, description, url;
  final int price, size, id;
  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
    required this.url,
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: "Arbys",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/rest1.png",
    color: Color(0xFF3D82AE),
    url:'https://www.arbys.com/deals/',),
  Product(
    id: 2,
    title: "Red Lobster",
    price: 234,
    size: 8,
    description: dummyText,
    image: "assets/images/rest11.png",
    color: Color(0xFFD3A984),
    url: 'https://www.redlobster.com/rewards',),
  Product(
    id: 3,
    title: "H",
    price: 234,
    size: 10,
    description: dummyText,
    image: "assets/images/rest12.png",
    color: Color(0xFF989493),
    url: "https://www.redrobin.com/rewards",),
  Product(
      id: 4,
      title: "O",
      price: 234,
      size: 11,
      description: dummyText,
      image: "assets/images/rest4.png",
      color: Color(0xFFE6B398),
      url: "https://www.applebees.com/en/sign-up"),
  Product(
      id: 5,
      title: "O",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/rest5.png",
      color: Color(0xFFFB7883),
      url: "http://aubonpain.fbmta.com/members/UpdateProfile.aspx?Action=Subscribe&_Theme=21474836609&inputsource=w"),
  Product(
      id: 6,
      title: "O",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/rest6.png",
      color: Color(0xFFAEAEAE),
      url: "https://www.bajafresh.com/clubbaja/"
  ),
  Product(
      id: 7,
      title: "Of",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/rest7.png",
      color: Color(0xFFD3A984),
      url: "https://www.johnnyrockets.com/promotions/rocket-eclub"
  ),
  Product(
      id: 8,
      title: "C",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/rest8.png",
      color: Color(0xFFAEAEAE),
      url: "https://www.noodles.com/rewards/"
  ),
  Product(
      id: 9,
      title: "O",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/rest5.png",
      color: Color(0xFF3D82AE),
      url: "http://aubonpain.fbmta.com/members/UpdateProfile.aspx?Action=Subscribe&_Theme=21474836609&inputsource=w"
  ),
  Product(
      id: 10,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/rest10.png",
      color: Color(0xFFD3A984),
      url: "https://www.papaginos.com/rewards"
  ),

];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";