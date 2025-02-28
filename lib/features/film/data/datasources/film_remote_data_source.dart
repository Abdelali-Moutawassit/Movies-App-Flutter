

import 'package:movies_app_cla/core/databases/api/api_consumer.dart';
import 'package:movies_app_cla/core/databases/api/end_points.dart';
import 'package:movies_app_cla/features/film/data/models/film_model.dart';

class FilmRemoteDataSource {
  final ApiConsumer api;

  FilmRemoteDataSource({required this.api});

  Future<List<FilmModel>> getFilms() async {
    try {
      final response = await api.get(EndPoints.popularMovies);

      if (response == null || !response.containsKey('results')) {
        throw Exception(
            "Aucune donnée reçue ou clé 'results' absente dans la réponse");
      }

      return (response['results'] as List)
          .map((user) => FilmModel.fromJson(user))
          .toList();
    } catch (error) {
      throw Exception("Erreur lors de la récupération des users : $error");
    }
  }
}
