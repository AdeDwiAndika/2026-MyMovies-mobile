import 'package:mymovies/features/movie/domain/entities/movie_detail.dart';

import '../entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getPopularMovies();
  Future<MovieDetail> getMovieDetail(int movieId);
  Future<List<Movie>> getSimilarMovies(int movieId);
  Future<List<Movie>> searchMovies(String query);
}