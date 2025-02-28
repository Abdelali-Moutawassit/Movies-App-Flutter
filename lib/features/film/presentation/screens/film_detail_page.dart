import 'package:flutter/material.dart';
import 'package:movies_app_cla/features/film/domain/entities/film_entity.dart';

class FilmDetailPage extends StatelessWidget {
  final FilmEntity film;

  const FilmDetailPage({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(film.title, style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Arrière-plan flouté avec l'image du film
          Positioned.fill(
            child: Image.network(
              "https://image.tmdb.org/t/p/w500${film.backdrop_path}",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.9),
                ],
              ),
            ),
          ),
          // Contenu principal
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                    height: 100), // Pour éviter le chevauchement avec l'AppBar
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w500${film.poster_path}",
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        film.original_title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 20),
                          const SizedBox(width: 5),
                          Text(
                            "${film.vote_average.toStringAsFixed(1)}/10",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                          const SizedBox(width: 20),
                          Icon(Icons.date_range,
                              color: Colors.white70, size: 20),
                          const SizedBox(width: 5),
                          Text(
                            film.release_date,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white70),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Synopsis",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        film.overview,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
