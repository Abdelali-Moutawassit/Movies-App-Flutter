import 'package:dartz/dartz.dart';
import 'package:movies_app_cla/core/connection/network_info.dart';
import 'package:movies_app_cla/core/errors/expentions.dart';
import 'package:movies_app_cla/core/errors/failure.dart';
import 'package:movies_app_cla/features/film/data/datasources/film_local_data_source.dart';
import 'package:movies_app_cla/features/film/data/datasources/film_remote_data_source.dart';
import 'package:movies_app_cla/features/film/domain/entities/film_entity.dart';
import 'package:movies_app_cla/features/film/domain/repositories/film_repository.dart';

class FilmRepositoryImpl extends FilmRepository {
  final NetworkInfo networkInfo;
  final FilmRemoteDataSource remoteDataSource;
  final FilmLocalDataSource localDataSource;

  FilmRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<FilmEntity>>> getFilms() async {
    if (await networkInfo.isConnected!) {
      try {
        final remotefilms = await remoteDataSource.getFilms();
        localDataSource.cacheFilms(remotefilms);
        return Right(remotefilms);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localFilms = await localDataSource.getFilms();
        return Right(localFilms);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
