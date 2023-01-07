import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Populares', style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),

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
       color: Colors.green,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    ) ;
    
  }
}