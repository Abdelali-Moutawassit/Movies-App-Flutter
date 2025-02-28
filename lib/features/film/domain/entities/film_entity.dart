class FilmEntity {
  int id;
  bool adult;
  String backdrop_path;
  String original_title;
  String overview;
  String poster_path;
  String title;
  double vote_average;
  String release_date;

  FilmEntity({
    required this.id,
    required this.adult,
    required this.backdrop_path,
    required this.original_title,
    required this.overview,
    required this.poster_path,
    required this.title,
    required this.vote_average,
    required this.release_date,
  });
}
