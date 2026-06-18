import 'package:mymovies/features/movie/domain/entities/movie.dart';

abstract class FavoriteRepository {
  Future<void> saveFavorite(Movie movie);
  Future<void> removeFavorite(int id);
  Future<List<Movie>> getFavorites();
  Future<bool> isFavorite(int id);
}