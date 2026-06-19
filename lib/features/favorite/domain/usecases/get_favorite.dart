import 'package:mymovies/features/favorite/domain/repositories/favorite_movie_repository.dart';
import 'package:mymovies/features/movie/domain/entities/movie.dart';

class GetFavorites {
  final FavoriteRepository repository;

  GetFavorites(this.repository);

  Future<List<Movie>> call() {
    return repository.getFavorites();
  }
}