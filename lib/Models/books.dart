import 'package:flutter/material.dart';

class Book {
  final String image, title, description, url;
  final int price, size, id;
  final Color color;
  final bool favorite;
  final String urlImage;

  const Book({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
    required this.url,
    required this.favorite,
    required this.urlImage,

});

}

const allBooks = [
  Book(
    favorite: true,
    id: 0,
    title: "Arbys",
    price: 234,
    size: 12,
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    image: "assets/images/rest1.png",
    color: Color(0xFF3D82AE),
    url:'https://www.arbys.com/deals/',
  urlImage: 'https://images.unsplash.com/photo-1523169054-66018b90af5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
  Book(
    favorite: false,
    id: 1,
    title: "Red Lobster",
    price: 234,
    size: 8,
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    image: "assets/images/rest11.png",
    color: Color(0xFFD3A984),
    url: 'https://www.redlobster.com/rewards',
urlImage: 'https://images.unsplash.com/photo-1523169054-66018b90af5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),

  Book(
    favorite: false,
    id: 2,
    title: "Red Robin",
    price: 234,
    size: 10,
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    image: "assets/images/rest12.png",
    color: Color(0xFF989493),
    url: "https://www.redrobin.com/rewards",
urlImage: 'https://images.unsplash.com/photo-1523169054-66018b90af5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
  Book(
      favorite: false,
      id: 3,
      title: "Applebee's",
      price: 234,
      size: 11,
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
      image: "assets/images/rest4.png",
      color: Color(0xFFE6B398),
      url: "https://www.applebees.com/en/sign-up",
urlImage: 'https://images.unsplash.com/photo-1523169054-66018b90af5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
  Book(
      favorite: false,
      id: 4,
      title: "Au Bon Pain",
      price: 234,
      size: 12,
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
      image: "assets/images/rest5.png",
      color: Color(0xFFFB7883),
      url: "http://aubonpain.fbmta.com/members/UpdateProfile.aspx?Action=Subscribe&_Theme=21474836609&inputsource=w",
urlImage: 'https://images.unsplash.com/photo-1523169054-66018b90af5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),

Book(
      favorite: false,
      id: 5,
      title: "Baja Fresh",
      price: 234,
      size: 12,
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
      image: "assets/images/rest6.png",
      color: Color(0xFFAEAEAE),
      url: "https://www.bajafresh.com/clubbaja/",
urlImage: 'https://images.unsplash.com/photo-1523169054-66018b90af5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
  Book(
      favorite: false,
      id: 6,
      title: "Johnny Rockets",
      price: 234,
      size: 12,
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
      image: "assets/images/rest6.png",
      color: Color(0xFFD3A984),
      url: "https://www.johnnyrockets.com/promotions/rocket-eclub",
urlImage: 'https://images.unsplash.com/photo-1523169054-66018b90af5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
  Book(
      favorite: false,
      id: 7,
      title: "The Noodle Company",
      price: 234,
      size: 12,
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
      image: "assets/images/rest7.png",
      color: Color(0xFFAEAEAE),
      url: "https://www.noodles.com/rewards/",
urlImage: 'https://images.unsplash.com/photo-1523169054-66018b90af5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
  Book(
      favorite: false,
      id: 8,
      title: "Au BOn Pain",
      price: 234,
      size: 12,
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
      image: "assets/images/rest5.png",
      color: Color(0xFF3D82AE),
      url: "http://aubonpain.fbmta.com/members/UpdateProfile.aspx?Action=Subscribe&_Theme=21474836609&inputsource=w",
urlImage: 'https://images.unsplash.com/photo-1523169054-66018b90af5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
  Book(
      favorite: false,
      id: 9,
      title: "Papa Gino's",
      price: 234,
      size: 12,
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
      image: "assets/images/rest9.png",
      color: Color(0xFFD3A984),
      url: "https://www.papaginos.com/rewards",
urlImage: 'https://images.unsplash.com/photo-1523169054-66018b90af5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),

];
String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";