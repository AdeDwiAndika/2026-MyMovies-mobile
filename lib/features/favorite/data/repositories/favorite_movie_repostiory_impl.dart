import 'package:mymovies/features/favorite/data/datasources/movie_local_data_source.dart';
import 'package:mymovies/features/favorite/domain/repositories/favorite_movie_repository.dart';
import 'package:mymovies/features/movie/domain/entities/movie.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteLocalDataSource localDataSource;

  FavoriteRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveFavorite(Movie movie) {
    return localDataSource.saveFavorite(movie);
  }

  @override
  Future<void> removeFavorite(int id) {
    return localDataSource.removeFavorite(id);
  }

  @override
  Future<List<Movie>> getFavorites() {
    return localDataSource.getFavorites();
  }

  @override
  Future<bool> isFavorite(int id) {
    return localDataSource.isFavorite(id);
  }
}