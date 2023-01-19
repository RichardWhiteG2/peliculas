import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate {


  //Cambia leyenda en el serch
  @override
  String get searchFieldLabel => 'Buscar Pelicula';


  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: const Icon (Icons.clear),
        onPressed: () => query = '',
      
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('buildResults');
    // TODO: implement buildResults
    
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    if(query.isEmpty){
      return Container(
        child: Center(
          child: Icon( Icons.movie_creation_outlined, color: Colors.black38, size: 130,)
        ),
      );
    }
    return Container();
    
  }

}