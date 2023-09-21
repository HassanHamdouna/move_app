import 'package:flutter/cupertino.dart';
import 'package:move_app/app/screen/bottom_navigation_bar_screen.dart';
import 'package:move_app/app/screen/video_player_screen.dart';
import 'package:move_app/movies/presentation/screens/movie_detail_screen.dart';
import 'package:move_app/movies/presentation/screens/movie_list_popular_and_top_rated_screen.dart';
import 'package:move_app/movies/presentation/screens/movies_screen.dart';
import 'package:move_app/tvs/presentation/screens/tv_detail_screen.dart';
import 'package:move_app/tvs/presentation/screens/tv_detail_tab_bar_screen.dart';
import 'package:move_app/tvs/presentation/screens/tv_list_popular_and_top_rated_screen.dart';
import 'package:move_app/tvs/presentation/screens/tv_screen.dart';

extension ContextHelper on BuildContext{


  static final Map<String, WidgetBuilder> _routes = {
    '/movies_screen': (context) => const MoviesScreen(),
    '/movies_detail_screen': (context,{arguments}) =>  MovieDetailScreen(id: arguments['id']),
    '/movies_list_popular_and_top_rated_screen': (context,{arguments}) =>  MovieListPopularAndTopRatedScreen(nameScreen: arguments['nameScreen'] ),
    '/tv_screen': (context) => const TvScreen(),
    '/tv_list_popular_and_top_rated_screen': (context, {arguments}) => TvListPopularAndTopRatedScreen(nameScreen: arguments['nameScreen']),
    '/tv_detail_screen': (context,{arguments}) =>  TvDetailScreen(id: arguments['id']),
    '/tv_detail_tab_bar_screen': (context) => const TvDetailTabBarScreen(),
    '/bottom_navigation_bar_screen': (context) => const BottomNavigationBarScreen(),
    '/video_player_screen': (context) => const VideoPlayerScreen(),
  };

  // Getter to access the route map
  Map<String, WidgetBuilder> get routes => _routes;

  void navigateTo(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void pop() {
    Navigator.of(this).pop();
  }

  void replaceWith(String routeName) {
    Navigator.of(this).pushReplacementNamed(routeName);
  }

}

