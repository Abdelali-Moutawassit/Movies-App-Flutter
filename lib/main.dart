import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:movies_app_cla/core/connection/network_info.dart';
import 'package:movies_app_cla/core/databases/api/dio_consumer.dart';
import 'package:movies_app_cla/core/databases/cache/cache_helper.dart';
import 'package:movies_app_cla/features/film/data/datasources/film_local_data_source.dart';
import 'package:movies_app_cla/features/film/data/datasources/film_remote_data_source.dart';
import 'package:movies_app_cla/features/film/data/repositories/film_repository_impl.dart';
import 'package:movies_app_cla/features/film/domain/repositories/film_repository.dart';
import 'package:movies_app_cla/features/film/presentation/bloc/film_bloc.dart';
import 'package:movies_app_cla/features/film/presentation/bloc/film_event.dart';
import 'package:movies_app_cla/features/film/presentation/screens/film_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();

  final FilmRepository filmRepository = FilmRepositoryImpl(
    networkInfo: NetworkInfoImpl(DataConnectionChecker()),
    remoteDataSource: FilmRemoteDataSource(api: DioConsumer(dio: Dio())),
    localDataSource: FilmLocalDataSource(cache: CacheHelper()),
  );

  runApp(MyApp(filmRepository: filmRepository));
}

class MyApp extends StatelessWidget {
  final FilmRepository filmRepository;
  const MyApp({super.key, required this.filmRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilmBloc(filmRepository)..add(FetchFilms()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movies App',
        theme: ThemeData.dark(),
        home: FilmPage(),
      ),
    );
  }
}
