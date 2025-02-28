abstract class FilmEvent {}

class FetchFilms extends FilmEvent {}

class SearchFilmsEvent extends FilmEvent {
  final String query;

  SearchFilmsEvent(this.query);

}
