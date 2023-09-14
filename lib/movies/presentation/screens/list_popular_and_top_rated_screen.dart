import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/movies/presentation/components/item_popular_details_component.dart';
import 'package:move_app/movies/presentation/components/item_top_details_component.dart';
import 'package:move_app/movies/presentation/controllers/movies_bloc.dart';
import 'package:move_app/movies/presentation/controllers/movies_event.dart';

import '../../../core/services/services_locator.dart';

class ListPopularAndTopRatedScreen extends StatelessWidget {
  final String nameScreen;

  const ListPopularAndTopRatedScreen({super.key, required this.nameScreen});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: isPopularScreen
              ? const Text("popular Movies")
              : const Text("Top Rated Movies"),
        ),
        body: isPopularScreen ? const ItemPopularDetailsComponent() : const ItemTopDetailsComponent(),
      ),
    );
  }

  get isPopularScreen => nameScreen == "popular";
}
