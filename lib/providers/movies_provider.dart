



import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';


class MoviesProvider extends ChangeNotifier {

  String _apiKey   = 'b73afdb14d81ff27f916523d57fa5992';
  String _baseUrl  = 'api.themoviedb.org';
  String _language = 'es-ES';
  
  List<Movie> onDisplayMovies = [];

  MoviesProvider(){
    print('MoviesProvider inicializado');
    this.getOnDisplayMovies(); 
  }


//Peliculas a mostrar
  getOnDisplayMovies() async{
    var url =Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1'
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    //final Map<String, dynamic> decodedData = json.decode(response.body);

    //print(decodedData['results']);
    //print(nowPlayingResponse.results[1].title);
    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();

  }
}