

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Constants.dart';

import '../../Last/favorite_last22.dart';
import '../../Models/books.dart';
import '../../Models/user.dart';
import 'ProductImage2.dart';


class SearchList extends StatefulWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {

  String name = "";
  List<Map<String, dynamic>> data = [
    {
      'name': 'John',
      'image':
      'https://i.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
      'email': 'john@gmail.com'
    },
    {
      'name': 'Eric',
      'image':
      'https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI',
      'email': 'eric@gmail.com'
    },
    {
      'name': 'Mark',
      'image':
      'https://i.picsum.photos/id/449/200/300.jpg?grayscale&hmac=GcAk7XLOGeBrqzrEpBjAzBcZFJ9bvyMwvL1QENQ23Zc',
      'email': 'mark@gmail.com'
    },
    {
      'name': 'Ela',
      'image':
      'https://i.picsum.photos/id/3/200/300.jpg?blur=2&hmac=CgtEzNwC4BLEa1z5r0oGOsZPj5wJlqjU615MLuFillY',
      'email': 'ela@gmail.com'
    },
    {
      'name': 'Sue',
      'image':
      'https://i.picsum.photos/id/497/200/300.jpg?hmac=IqTAOsl408FW-5QME1woScOoZJvq246UqZGGR9UkkkY',
      'email': 'sue@gmail.com'
    },
    {
      'name': 'Lothe',
      'image':
      'https://i.picsum.photos/id/450/200/300.jpg?hmac=EAnz3Z3i5qXfaz54l0aegp_-5oN4HTwiZG828ZGD7GM',
      'email': 'lothe@gmail.com'
    },
    {
      'name': 'Alyssa',
      'image':
      'https://i.picsum.photos/id/169/200/200.jpg?hmac=MquoCIcsCP_IxfteFmd8LfVF7NCoRre282nO9gVD0Yc',
      'email': 'Alyssa@gmail.com'
    },
    {
      'name': 'Nichols',
      'image':
      'https://i.picsum.photos/id/921/200/200.jpg?hmac=6pwJUhec4NqIAFxrha-8WXGa8yI1pJXKEYCWMSHroSU',
      'email': 'Nichols@gmail.com'
    },
    {
      'name': 'Welch',
      'image':
      'https://i.picsum.photos/id/845/200/200.jpg?hmac=KMGSD70gM0xozvpzPM3kHIwwA2TRlVQ6d2dLW_b1vDQ',
      'email': 'Welch@gmail.com'
    },
    {
      'name': 'Delacruz',
      'image':
      'https://i.picsum.photos/id/250/200/200.jpg?hmac=23TaEG1txY5qYZ70amm2sUf0GYKo4v7yIbN9ooyqWzs',
      'email': 'Delacruz@gmail.com'
    },
    {
      'name': 'Tania',
      'image':
      'https://i.picsum.photos/id/237/200/200.jpg?hmac=zHUGikXUDyLCCmvyww1izLK3R3k8oRYBRiTizZEdyfI',
      'email': 'Tania@gmail.com'
    },
    {
      'name': 'Jeanie',
      'image':
      'https://i.picsum.photos/id/769/200/200.jpg?hmac=M55kAfuYOrcJ8a49hBRDhWtVLbJo88Y76kUz323SqLU',
      'email': 'Jeanie@gmail.com'
    }
  ];

  addData() async {
    for (var element in data) {
      FirebaseFirestore.instance.collection('users').add(element);
    }
    print('all data added');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Card(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search), hintText: 'Search...'),
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
              ),
            )),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('prueba1').snapshots(),
          builder: (context, snapshots) {
            return (snapshots.connectionState == ConnectionState.waiting)
                ? Center(
              child: CircularProgressIndicator(),
            )
                : ListView.builder(
                itemCount: snapshots.data!.docs.length,
                itemBuilder: (context, index) {
                  var data = snapshots.data!.docs[index].data()
                  as Map<String, dynamic>;

                  if (name.isEmpty) {
                    return ListTile(
                      title: Text(
                        data['name'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      /*
                      subtitle: Text(
                        data['name'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),


                       */

                      leading: Image.network(data['color'],height: 50, width: 50,  ),  // formato imagenes


                      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteLast33(
                        coment: data['description'],
                         color1: data['color1'], color2: data['color2'], color3: data['color3'], colorOp: data['colorOp'], color: data['color'], urlimage: data['urlimage'] ))),

                    );
                  }
                  if (data['name']
                      .toString()
                      .toLowerCase()
                      .startsWith(name.toLowerCase())) {
                    return ListTile(
                      title: Text(
                        data['name'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      /*
                      subtitle: Text(
                        data['name'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),

                       */
                      leading: Image.network(data['color'],height: 50, width: 50,  ),  // formato imagenes

                      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteLast33(
                        coment: data['description'],
                        color1: data['color1'], color2: data['color2'], color3: data['color3'],
                        colorOp: data['colorOp'], color: data['color'],
                      urlimage: data['urlimage'],))),

                    );
                  }
                  return Container();
                });
          },
        ));
  }
}



class FavoriteLast33 extends StatefulWidget {
final String color;
final String coment;
final int color1;
final int color2;
final int color3;
final double colorOp;
final String urlimage;




  const FavoriteLast33({Key? key, required this.color1, required this.coment, required this.color2, required this.color3, required this.colorOp, required this.color, required this.urlimage}) : super(key: key);

  @override
  State<FavoriteLast33> createState() => _FavoriteLast33State();
}

class _FavoriteLast33State extends State<FavoriteLast33> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(


      appBar: AppBar(
        backgroundColor:  Colors.transparent,

        elevation: 0,
        leading: IconButton(icon: SvgPicture.asset(
          'assets/icons/back.svg', color: Colors.white,),
          onPressed: () => Navigator.pop(context),
        ),

      ),
      backgroundColor: Color.fromRGBO(widget.color1, widget.color2, widget.color3, widget.colorOp),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height ,
              child: Stack(
                fit: StackFit.loose,
                children:<Widget> [

                  Row(
                    mainAxisAlignment : MainAxisAlignment.center,

                    children: <Widget>[


                      Container( width: 200, height: 200,
                        child: Expanded(child:
                        Image.network(widget.color, fit: BoxFit.fill, )
                          // child: Expanded(child: Image("assets/images/rest${user.id}.png"), fit: BoxFit.fill,),


                        ),
                      ),
                    ],
                  ),



                 // ProductImage2(user: widget.data   ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.35 ),
                    padding: EdgeInsets.only(top: size.height * 0.2, left: kDefaultPaddin, right: kDefaultPaddin),
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
                        Text(widget.coment)
                      //  Description(user: widget.data),

                      ],
                    )
                    ,
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width/6,
                    top: MediaQuery.of(context).size.height/1.5,
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

                          await launch(widget.urlimage)

                        },





                      ),


                    ),
                  ),




                ],
              ),
            ),
          ],
        ),
      ),


    );
  }








}



