
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    //Para conocer el tamaño de la pantalla y scar el 50%
    final size = MediaQuery.of(context).size;



    return Container(
      width: double.infinity,  //Tomar todo el ancho posible basado en el padre.
      height: size.height * 0.5,
      //color: Colors.pinkAccent,
      //Construccion del carrete
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.5,
        itemBuilder: ( _ , int index){
          
          return GestureDetector(
            //NAvigator te lleva a otra pantalla. 
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
            //ClipRRect genera bordes redondeados. 
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/300x400'),
                fit: BoxFit.cover,
                
              ),
            ),
          );

        },
        
      ),
    );
  }
}