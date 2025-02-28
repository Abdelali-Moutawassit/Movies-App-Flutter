import 'package:movies_app_cla/features/film/domain/entities/film_entity.dart';

abstract class FilmState {}

class FilmInitial extends FilmState {}

class GetFilmLoading extends FilmState {}

class GetFilmLoaded extends FilmState {
  final List<FilmEntity> films;

  GetFilmLoaded({required this.films});
}

class GetFilmFailure extends FilmState {
  final String errMessage;

  GetFilmFailure({required this.errMessage});
}
