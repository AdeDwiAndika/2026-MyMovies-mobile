import '../../domain/entities/movie.dart';

abstract class SearchMovieState {}

class SearchMovieInitial extends SearchMovieState {}

class SearchMovieLoading extends SearchMovieState {}

class SearchMovieLoaded extends SearchMovieState {
  final List<Movie> movies;

  SearchMovieLoaded(this.movies);
}

class SearchMovieError extends SearchMovieState {
  final String message;

  SearchMovieError(this.message);
}
