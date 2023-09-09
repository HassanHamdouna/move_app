import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/movies/presentation/controllers/movies_event.dart';
import 'package:move_app/movies/presentation/controllers/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(const MoviesState()){

  }
}
