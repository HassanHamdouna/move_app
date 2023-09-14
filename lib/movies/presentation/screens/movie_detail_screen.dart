import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/movies/presentation/components/detail_movies_component.dart';
import 'package:move_app/movies/presentation/controllers/movie_details_bloc.dart';
import 'package:move_app/movies/presentation/controllers/movie_details_event.dart';

import '../../../core/services/services_locator.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieDetailsBloc>()..add(GetDetailsMovieEvent(id))..add(GetRecommendationMovieEvent(id)),
      child: const Scaffold(
        body: DetailMoviesComponent(),

      ),
    );
  }
}
