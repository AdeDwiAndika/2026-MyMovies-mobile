import 'package:mymovies/features/movie/domain/entities/movie_detail.dart';
import 'package:mymovies/features/movie/domain/repositories/movie_repository.dart';

class GetMovieDetail {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  Future<MovieDetail> call(int movieId) {
    return repository.getMovieDetail(movieId);
  }
}
