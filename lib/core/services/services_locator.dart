import 'package:get_it/get_it.dart';

import 'package:move_app/movies/data/datasourec/movie_remote_data_source.dart';
import 'package:move_app/movies/data/repository/movies_repository.dart';
import 'package:move_app/movies/domain/repository/base_movie_repository.dart';
import 'package:move_app/movies/domain/useCase/get_now_playing_movies_usecase.dart';
import 'package:move_app/movies/domain/useCase/get_top_rated_movies_usecase.dart';
import 'package:move_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:move_app/movies/domain/usecase/get_movie_recommendation_usecase.dart';
import 'package:move_app/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:move_app/movies/presentation/controllers/movie_details_bloc.dart';
import 'package:move_app/movies/presentation/controllers/movies_bloc.dart';
import 'package:move_app/tvs/data/datasource/tv_remote_data_source.dart';
import 'package:move_app/tvs/data/repository/tv_repository.dart';
import 'package:move_app/tvs/domain/repository/base_tv_repository.dart';
import 'package:move_app/tvs/domain/usecaus/get_tv_on_the_air_usecase.dart';
import 'package:move_app/tvs/domain/usecaus/get_tv_popular_usecase.dart';
import 'package:move_app/tvs/domain/usecaus/get_tv_top_rated_usecase.dart';
import 'package:move_app/tvs/presentation/controllers/tv_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() async {
    /// Bloc Movie
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl(),));
    /// Bloc Tv
    sl.registerFactory(() => TvBloc(sl(), sl(), sl()));

    /// Use Cases Movie
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieRecommendationUseCase(sl()));
    /// Use Cases Tv
    sl.registerLazySingleton(() => GetTvOnTheAirUseCase(sl()));
    sl.registerLazySingleton(() => GetTvPopularUseCase(sl()));
    sl.registerLazySingleton(() => GetTvTopRatedUseCase(sl()));
;

    /// Repository Movie
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));
    /// Repository Tv
    sl.registerLazySingleton<BaseTvRepository>(() => TvRepository(sl()));

    /// DATA SOURCE Movie
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
    /// DATA SOURCE TV
    sl.registerLazySingleton<BaseTvRemoteDataSource>(() => TvRemoteDataSource());
  }
}
