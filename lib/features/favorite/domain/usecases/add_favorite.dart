import 'package:mymovies/features/favorite/domain/repositories/favorite_movie_repository.dart';
import 'package:mymovies/features/movie/domain/entities/movie.dart';

class AddFavorite {
  final FavoriteRepository repository;

  AddFavorite(this.repository);

  Future<void> call(Movie movie) {
    return repository.saveFavorite(movie);
  }
}