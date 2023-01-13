import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {

  //const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {


    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {}, 
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          //Tarjetas principales
          CardSwiper(movies: moviesProvider.onDisplayMovies),


          //Listado horizontal de peliculas.

          MovieSlider(),
        ],
      ),
      )
    );
  }
}