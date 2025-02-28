import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_cla/features/film/presentation/bloc/film_bloc.dart';
import 'package:movies_app_cla/features/film/presentation/bloc/film_state.dart';
import 'package:movies_app_cla/features/film/presentation/widgets/bar_search.dart';
import 'package:movies_app_cla/features/film/presentation/widgets/buttom_navigation_bar.dart';
import 'package:movies_app_cla/features/film/presentation/widgets/carousel.dart';
import 'package:movies_app_cla/features/film/presentation/widgets/drawer_perso.dart';
import 'package:movies_app_cla/features/film/presentation/widgets/film_list.dart';
import 'package:movies_app_cla/features/film/presentation/screens/notification_page.dart';

class FilmPage extends StatefulWidget {
  @override
  _FilmPageState createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    FilmHomePage(),
    Center(child: Text("Profile", style: TextStyle(fontSize: 22))),
    Center(child: Text("Settings", style: TextStyle(fontSize: 22))),
    Center(child: Text("Favorites", style: TextStyle(fontSize: 22))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Zeo Film",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        elevation: 8,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.indigo],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationPage()),
              );
            },
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: ButtomNavigationBar(),
    );
  }
}

class FilmHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmBloc, FilmState>(
      builder: (context, state) {
        if (state is GetFilmLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetFilmLoaded) {
          return Column(
            children: [
              BarSearch(),
              Carousel(films: state.films),
              const SizedBox(height: 30),
              Expanded(child: FilmList(films: state.films)),
            ],
          );
        } else if (state is GetFilmFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        return const Center(child: Text("Aucun film disponible"));
      },
    );
  }
}
