import 'package:mymovies/features/movie/domain/entities/movie_detail.dart';

abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetail movie;

  MovieDetailLoaded(this.movie);
}

class MovieDetailError extends MovieDetailState {
  final String message;

  MovieDetailError(this.message);
}
