import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  String id;
  final String name;
  final int age;
  final DateTime birthday;
  final bool favorite;
  final String color;
  final int color1;
  final int color2;
  final int color3;


  User({
this.id = '',
required this.name,
required this.age,
required this.birthday,
    required this.favorite,
    required this.color,
    required this.color1,
    required this.color2,
    required this.color3,


});


  Map<String, dynamic> toJson()=> {
    'id' : id,
    'name':name,
    'age': age,
    'birthday':birthday,
    'favorite':favorite,
    'color':color,
    'color1':color1,
    'color2':color2,
    'color3':color3,



  };

  static User fromJson(Map<String, dynamic> json) => User(
id: json['id'],
name : json['name'],
    age : json['age'],
    birthday: (json['birthday'] as Timestamp).toDate(),
    favorite: json['favorite'],
    color:json['color'],
      color1:json['color1'],
  color2:json['color2'],
  color3:json['color3'],




  );


}