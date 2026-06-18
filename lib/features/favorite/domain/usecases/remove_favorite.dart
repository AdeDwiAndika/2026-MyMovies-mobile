import 'package:mymovies/features/favorite/domain/repositories/favorite_movie_repository.dart';

class RemoveFavorite {
  final FavoriteRepository repository;

  RemoveFavorite(this.repository);

  Future<void> call(int id) {
    return repository.removeFavorite(id);
  }
}