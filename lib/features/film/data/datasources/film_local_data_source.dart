import 'dart:convert';
import 'package:movies_app_cla/core/databases/cache/cache_helper.dart';
import 'package:movies_app_cla/core/errors/expentions.dart';
import 'package:movies_app_cla/features/film/data/models/film_model.dart';


class FilmLocalDataSource {
  final CacheHelper cache;
  final String key = "CacheFilms";

  FilmLocalDataSource({required this.cache});

  Future<void> cacheFilms(List<FilmModel> filmsToCache) async {
    if (filmsToCache.isNotEmpty) {
      final jsonString = json.encode(
        filmsToCache.map((film) => film.toJson()).toList(),
      );
      await cache.saveData(key: key, value: jsonString);
    } else {
      throw CacheExeption(
          errorMessage: "Aucune donnée à stocker dans le cache.");
    }
  }

  Future<List<FilmModel>> getFilms() async {
    final jsonString = cache.getDataString(key: key);

    if (jsonString != null) {

      List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((film) => FilmModel.fromJson(film)).toList();
    } else{
      throw CacheExeption(errorMessage: "Aucune donnée en cache.");
    }
  }
}
