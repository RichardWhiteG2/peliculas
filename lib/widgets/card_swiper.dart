
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class CardSwiper extends StatelessWidget {
  
  final List <Movie> movies;

  const CardSwiper({
    super.key, 
    required this.movies
  });

  @override
  Widget build(BuildContext context) {

    //Para conocer el tamaño de la pantalla y scar el 50%
    final size = MediaQuery.of(context).size;

    if(this.movies.length==0){
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Center(
          child: CircularProgressIndicator(),
        ) 
      );
    }

    return Container(
      width: double.infinity,  //Tomar todo el ancho posible basado en el padre.
      height: size.height * 0.5,
      //color: Colors.pinkAccent,
      
      //Construccion del carrete
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.5,
        itemBuilder: ( _ , int index){

          final movie = movies[index];
          
          
          return GestureDetector(
            //NAvigator te lleva a otra pantalla. 
            onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
            //ClipRRect genera bordes redondeados. 
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover,
                
              ),
            ),
          );

        },
        
      ),
    );
  }
}