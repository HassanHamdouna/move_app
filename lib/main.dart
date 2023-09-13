import 'package:flutter/material.dart';
import 'package:move_app/core/services/services_locator.dart';
import 'package:move_app/core/utils/app_strings.dart';
import 'package:move_app/movies/data/datasourec/movie_remote_data_source.dart';
import 'package:move_app/movies/data/repository/movies_repository.dart';
import 'package:move_app/movies/domain/repository/base_movie_repository.dart';
import 'package:move_app/movies/domain/useCase/get_now_playing_movies_usecase.dart';
import 'package:move_app/movies/presentation/screens/movies_screen.dart';

void main() async{
  ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900
      ),
      home: const MoviesScreen(),
    );
  }
}
