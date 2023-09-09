import 'package:get_it/get_it.dart';
import 'package:move_app/movies/data/datasourec/movie_remote_data_source.dart';
import 'package:move_app/movies/data/repository/movies_repository.dart';
import 'package:move_app/movies/domain/repository/base_movie_repository.dart';
import 'package:move_app/movies/domain/useCase/get_now_playing_movies_usecase.dart';
import 'package:move_app/movies/presentation/controllers/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));

    /// Use Cases

    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    /// Data Source
    sl.registerLazySingleton<BaseRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
