import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class TvGenres extends Equatable {
  final int id;
  final String name;

  const TvGenres({required this.id, required this.name});

  @override
  List<Object> get props => [id, name];
}