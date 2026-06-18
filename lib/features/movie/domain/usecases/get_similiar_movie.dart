import 'package:mymovies/features/movie/domain/entities/movie.dart';
import 'package:mymovies/features/movie/domain/repositories/movie_repository.dart';

class GetSimilarMovies {
  final MovieRepository repository;

  GetSimilarMovies(this.repository);

  Future<List<Movie>> call(int movieId) {
    return repository.getSimilarMovies(movieId);
  }
}
