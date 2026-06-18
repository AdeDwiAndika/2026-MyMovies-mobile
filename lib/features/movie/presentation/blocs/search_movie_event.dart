abstract class SearchMovieEvent {}

class SearchMovie extends SearchMovieEvent {
  final String query;

  SearchMovie(this.query);
}
