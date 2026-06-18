import 'package:mymovies/features/movie/domain/entities/movie.dart';
import 'package:mymovies/features/movie/domain/repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<List<Movie>> call(String query) {
    return repository.searchMovies(query);
  }
}
