



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
  List<Movie> popularMovies = [];
  List<Movie> upcomingMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  int _popularPage =0;
  int _upcomingPage =0;

  MoviesProvider(){
    print('MoviesProvider inicializado');
    this.getOnDisplayMovies(); 

    this.getPopularMovies();

    this.getUpcomingMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1] )async{
     var url =Uri.https(_baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page'
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }


//Peliculas a mostrar
  getOnDisplayMovies() async{
    
    final jsonData = await this._getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
  
    onDisplayMovies = nowPlayingResponse.results;
  
    notifyListeners();

  }
  
  
  getPopularMovies() async{
    
    _popularPage++;
    final jsonData = await this._getJsonData('3/movie/popular', _popularPage);
    
    final popularResponse = PopularResponse.fromJson(jsonData);//PopularResponse.fromJson(response.body);
    //final Map<String, dynamic> decodedData = json.decode(response.body);

    //print(decodedData['results']);
    //print(nowPlayingResponse.results[1].title);
    popularMovies = [...popularMovies, ...popularResponse.results];
    print(popularMovies[0]);
    notifyListeners();
  }

  Future <List<Cast>> getMovieCast ( int movieId) async{
    
    if(moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData = await this._getJsonData('3/movie/$movieId/credits');

    final creditsResponse = CreditsResponse.fromJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;

  }

  getUpcomingMovies() async {
    _upcomingPage++;
    final jsonData = await this._getJsonData('3/movie/upcoming', _popularPage);
    
    final upcomingResponse = UpcomingResponse.fromJson(jsonData);//PopularResponse.fromJson(response.body);

    
    upcomingMovies =  [...upcomingMovies, ...upcomingResponse.results];
    //print(upcomingMovies[0]);
    notifyListeners();
  }
}