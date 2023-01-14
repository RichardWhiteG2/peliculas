import 'package:flutter/material.dart';

import '../models/models.dart';

class MovieSlider extends StatefulWidget {
  
  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  const MovieSlider({
    super.key, 
    required this.movies, 
    this.title, 
    required this.onNextPage});

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

final ScrollController scrollController = new ScrollController();
//Cuando el widget es creado
@override
  void initState() {
    super.initState();
    scrollController.addListener((){
      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500){
        widget.onNextPage();

      }
      //Ver hasta donde llega el scroll
      //print(scrollController.position.maxScrollExtent);

     });



  }

//Cuando el widget es destruido
  @override
  void dispose() {
    



    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if(this.widget.title!=null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(this.widget.title!, style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),

          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: ( _ , int index) => _MoviePoster(widget.movies[index])
                
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