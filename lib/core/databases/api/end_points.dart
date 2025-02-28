class EndPoints {
  static const String baserUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "b14d8029a8eeb36372e6fea3797df9e9";
  static const String imageBaseUrl = "https://image.tmdb.org/t/p/w500";

  // Endpoints
  static const String popularMovies = "$baserUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMovies = "$baserUrl/movie/top_rated?api_key=$apiKey";
  static const String upcomingMovies = "$baserUrl/movie/upcoming?api_key=$apiKey";

  static String movieDetails(int movieId) => "$baserUrl/movie/$movieId?api_key=$apiKey";
  static String movieSearch(String query) => "$baserUrl/search/movie?api_key=$apiKey&query=$query";

  // Fonction pour obtenir l'URL complète de l'image d'un film
  static String getImageUrl(String path) => "$imageBaseUrl$path";
}
