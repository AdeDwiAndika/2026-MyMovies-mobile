import 'package:mymovies/features/movie/domain/entities/movie.dart';

abstract class FavoriteLocalDataSource {
  Future<void> saveFavorite(Movie movie);
  Future<void> removeFavorite(int movieId);
  Future<List<Movie>> getFavorites();
  Future<bool> isFavorite(int movieId);
}