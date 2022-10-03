import 'package:flutter/material.dart';


class MySearchDelegate extends SearchDelegate {
  List<String> searchTerms = [


  ];

  @override
  List<Widget>? buildActions(BuildContext context)  {
    return [
      IconButton(onPressed: (){  if(query.isEmpty){
        close(context, null);
      }
      else {
        query = '';}}, icon: const Icon(Icons.clear))

    ];


  }



  @override
  Widget? buildLeading(BuildContext context) {
    return
      IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {close(context, null);  },);
  }


  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text(query, style: const TextStyle(fontSize: 64 ),),);


  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = searchTerms.where((searchTerms) {
      final result = searchTerms.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);

    }).toList();
    /*
    for(var fruit in searchTerms){
      if(fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
*/

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        final matchquery = matchQuery[index];

        return ListTile(title:Text(matchquery), onTap: (){
          query = matchquery;
          showResults(context);
        },);
        /*
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );

     */
      },

    );
  }
}
