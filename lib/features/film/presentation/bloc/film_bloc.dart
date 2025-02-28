import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:movies_app_cla/core/connection/network_info.dart';
import 'package:movies_app_cla/core/databases/api/dio_consumer.dart';
import 'package:movies_app_cla/core/databases/cache/cache_helper.dart';
import 'package:movies_app_cla/features/film/data/datasources/film_local_data_source.dart';
import 'package:movies_app_cla/features/film/data/datasources/film_remote_data_source.dart';
import 'package:movies_app_cla/features/film/data/repositories/film_repository_impl.dart';
import 'package:movies_app_cla/features/film/domain/entities/film_entity.dart';
import 'package:movies_app_cla/features/film/domain/repositories/film_repository.dart';
import 'package:movies_app_cla/features/film/domain/usecases/get_film.dart';
import 'package:movies_app_cla/features/film/presentation/bloc/film_event.dart';
import 'package:movies_app_cla/features/film/presentation/bloc/film_state.dart';

class FilmBloc extends Bloc<FilmEvent, FilmState> {
  final FilmRepository filmRepository;
  List<FilmEntity> allFilms = [];

  FilmBloc(this.filmRepository) : super(FilmInitial()) {
    on<FetchFilms>((event, emit) async {
      emit(GetFilmLoading());

      final failureOrFilms = await GetFilm(
        repository: FilmRepositoryImpl(
          networkInfo: NetworkInfoImpl(DataConnectionChecker()),
          remoteDataSource: FilmRemoteDataSource(api: DioConsumer(dio: Dio())),
          localDataSource: FilmLocalDataSource(cache: CacheHelper()),
        ),
      ).call();

      failureOrFilms.fold(
        (failure) => emit(GetFilmFailure(errMessage: failure.errMessage)),
        (films) {
          allFilms = films;
          emit(GetFilmLoaded(
              films: films));
        },
      );
    });

    on<SearchFilmsEvent>((event, emit) {
      if (event.query.isEmpty) {
        emit(GetFilmLoaded(
            films:
                allFilms));
      } else {
        final filteredFilms = allFilms
            .where((film) =>
                film.title.toLowerCase().contains(event.query.toLowerCase()))
            .toList();
        emit(GetFilmLoaded(films: filteredFilms));
      }
    });
  }
}
