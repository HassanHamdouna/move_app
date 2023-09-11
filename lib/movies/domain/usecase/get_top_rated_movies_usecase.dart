import 'package:dartz/dartz.dart';
import 'package:move_app/core/error/failure.dart';
import 'package:move_app/core/usecase/base_usecase.dart';
import 'package:move_app/movies/domain/entities/movie.dart';
import 'package:move_app/movies/domain/repository/base_movie_repository.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>> {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMoviesRepository.getTopRateMovies();
  }
}
