



import 'package:flutter/cupertino.dart';

class MoviesProvider extends ChangeNotifier {

  MoviesProvider(){
    print('MoviesProvider inicializado');
    this.getOnDisplayMovies(); 
  }


//Peliculas a mostrar
  getOnDisplayMovies() async{
    print('getOnDispayMovies');
  }
}