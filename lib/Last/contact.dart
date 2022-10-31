import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController emailController = new TextEditingController();
    TextEditingController emailController2 = new TextEditingController();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

               Padding(
                 padding: EdgeInsets.only(left:15, bottom: 20, right: 15, top:10),
                 child: Text(textAlign: TextAlign.center ,"Send us your comments below",),



               ),
          SizedBox(height: 10,),
          Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),

          ),
          SizedBox(height: 10,),
          Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: SizedBox(height: 300,
              child: TextFormField(
                controller: emailController2,
                decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 500.0),
                  border: OutlineInputBorder(),
                                  ),
              ),
            ),
          ),


                  SizedBox(height: 10,),

                 ElevatedButton(onPressed: () async{

                   final mailtoLink = Mailto(
                     to: [ 'contactmeday@gmail.com' ],
                     cc: [ emailController.text],
                     subject: 'MeDay Information',
                     body: emailController2.text ,
                   );
                   // Convert the Mailto instance into a string.
                   // Use either Dart's string interpolation
                   // or the toString() method.
                   await launch('$mailtoLink');

                 }, child: Text("Send Comments")),
],



      ),
    );



  }
}
