import 'package:mymovies/features/favorite/domain/repositories/favorite_movie_repository.dart';

class CheckIsFavorite {
  final FavoriteRepository repository;

  CheckIsFavorite(this.repository);

  Future<bool> call(int id) {
    return repository.isFavorite(id);
  }
}