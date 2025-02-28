import 'package:movies_app_cla/core/errors/failure.dart';
import 'package:movies_app_cla/features/film/domain/entities/film_entity.dart';
import 'package:movies_app_cla/features/film/domain/repositories/film_repository.dart';
import 'package:dartz/dartz.dart';

class GetFilm {
  final FilmRepository repository;

  GetFilm({required this.repository});

  Future<Either<Failure, List<FilmEntity>>> call() {
    return repository.getFilms();
  }
}
