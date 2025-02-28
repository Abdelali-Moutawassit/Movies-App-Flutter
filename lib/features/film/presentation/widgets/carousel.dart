import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movies_app_cla/features/film/domain/entities/film_entity.dart';

class Carousel extends StatefulWidget {
  final List<FilmEntity> films;

  const Carousel({super.key, required this.films});

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < widget.films.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 180,
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.films.length,
          itemBuilder: (context, index) {
            final film = widget.films[index];
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500${film.backdrop_path}",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
