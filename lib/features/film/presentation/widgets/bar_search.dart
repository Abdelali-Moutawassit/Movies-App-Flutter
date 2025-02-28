import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_cla/features/film/presentation/bloc/film_bloc.dart';
import 'package:movies_app_cla/features/film/presentation/bloc/film_event.dart';

class BarSearch extends StatefulWidget {
  const BarSearch({super.key});

  @override
  _BarSearchState createState() => _BarSearchState();
}

class _BarSearchState extends State<BarSearch> {
  bool _isFocused = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: _isFocused
              ? [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 1,
                  )
                ]
              : [],
        ),
        child: TextField(
          controller: _controller,
          onChanged: (query) {
            context.read<FilmBloc>().add(SearchFilmsEvent(query));
          },
          onTap: () {
            setState(() {
              _isFocused = true;
            });
          },
          onEditingComplete: () {
            setState(() {
              _isFocused = false;
            });
          },
          decoration: InputDecoration(
            hintText: "Rechercher un film...",
            hintStyle: TextStyle(color: Colors.grey.shade600),
            prefixIcon: const Icon(Icons.search, color: Colors.blueAccent),
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      _controller.clear();
                      context.read<FilmBloc>().add(SearchFilmsEvent(""));
                    },
                  )
                : null,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }
}
