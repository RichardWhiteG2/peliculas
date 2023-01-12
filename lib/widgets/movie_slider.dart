import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Populares', style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),

          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: ( _ , int index) => _MoviePoster()
                
            ),
          ),

        ],
      ),
    );
  }
}

//Comienza con guion baja para definir que es privado.
class _MoviePoster extends StatelessWidget {
  

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
                image: NetworkImage('https://via.placeholder.com/300x400.png'),
                width: 130,
                height: 190,
                fit:  BoxFit.cover,
              ),
            ),
          ),
          
          SizedBox( height: 5),

          Text(
            'Strat Wars corre perroo canta baila por tu casa',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    ) ;
    
  }
}