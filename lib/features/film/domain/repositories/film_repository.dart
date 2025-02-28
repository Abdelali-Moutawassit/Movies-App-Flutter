import 'package:dartz/dartz.dart';
import 'package:movies_app_cla/core/errors/failure.dart';
import 'package:movies_app_cla/features/film/domain/entities/film_entity.dart';

abstract class FilmRepository {
  Future<Either<Failure, List<FilmEntity>>> getFilms();
}
