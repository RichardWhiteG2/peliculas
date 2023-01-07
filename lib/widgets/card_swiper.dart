import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,  //Tomar todo el ancho posible basado en el padre.
      height: 500,
      color: Colors.pinkAccent,
    );
  }
}