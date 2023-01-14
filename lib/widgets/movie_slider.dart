import 'package:flutter/material.dart';

import '../models/models.dart';

class MovieSlider extends StatelessWidget {
  
  final List<Movie> movies;
  final String? title;

  const MovieSlider({
    super.key, 
    required this.movies, 
    this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if(this.title!=null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(this.title!, style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),

          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: ( _ , int index) => _MoviePoster(movies[index])
                
            ),
          ),

        ],
      ),
    );
  }
}

//Comienza con guion baja para definir que es privado.
class _MoviePoster extends StatelessWidget {
  //TODO:
  final Movie movie;

  const _MoviePoster(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
       width: 130,
       height: 190,
       
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            //NAvigator te lleva a otra pantalla. 
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
            //ClipRRect genera bordes redondeados.
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 190,
                fit:  BoxFit.cover,
              ),
            ),
          ),
          
          SizedBox( height: 5),

          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    ) ;
    
  }
}