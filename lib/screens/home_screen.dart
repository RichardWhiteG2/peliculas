import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../serch/serch_delegate.dart';


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
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()), 
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          SizedBox(height: 30),
          //Tarjetas principales
          CardSwiper(movies: moviesProvider.onDisplayMovies),
          SizedBox(height: 20),
          //Listado horizontal de peliculas.

          MovieSlider(
            movies: moviesProvider.upcomingMovies, //proximas
            title: 'Proximamente', //Opcional.
            onNextPage: () => moviesProvider.getUpcomingMovies(),
          ),
          SizedBox(height: 20),

          MovieSlider(
            movies: moviesProvider.popularMovies, //populares
            title: 'Populares', //Opcional.
            onNextPage: () => moviesProvider.getPopularMovies(),
          ),
          SizedBox(height:40),
        ],
      ),
      )
    );
  }
}