import 'package:flutter/material.dart';
import 'package:movies_app_cla/features/film/domain/entities/film_entity.dart';
import 'package:movies_app_cla/features/film/presentation/screens/film_detail_page.dart';

class FilmList extends StatelessWidget {
  final List<FilmEntity> films;

  const FilmList({super.key, required this.films});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        padding: const EdgeInsets.all(10),
        itemCount: films.length,
        itemBuilder: (context, index) {
          final film = films[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FilmDetailPage(film: film),
                ),
              );
            },
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w300${film.poster_path}",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  film.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
