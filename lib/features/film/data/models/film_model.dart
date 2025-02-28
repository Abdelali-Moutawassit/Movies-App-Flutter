
import 'package:movies_app_cla/features/film/domain/entities/film_entity.dart';

class FilmModel extends FilmEntity {

  

  FilmModel({
    required super.id,
    required super.adult,
    required super.backdrop_path,
    required super.original_title,
    required super.overview,
    required super.poster_path,
    required super.title,
    required super.vote_average,
    required super.release_date,
  });

  factory FilmModel.fromJson(Map<String, dynamic> json) {
    return FilmModel(
        id: json['id'],
        adult: json['adult'],
        backdrop_path: json['backdrop_path'],
        original_title: json['original_title'],
        overview: json['overview'],
        poster_path: json['poster_path'],
        title: json['title'],
        vote_average:json['vote_average'],
        release_date:json['release_date'],);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'adult': adult,
      'backdrop_path': backdrop_path,
      'original_title': original_title,
      'overview': overview,
      'poster_path': poster_path,
      'title': title,
    };
  }
}
