import 'package:mymovies/features/movie/domain/entities/movie_detail.dart';

import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Movie>> getPopularMovies() {
    return remoteDataSource.getPopularMovies();
  }

  @override
  Future<MovieDetail> getMovieDetail(int movieId) {
    return remoteDataSource.getMovieDetail(movieId);
  }

  @override
  Future<List<Movie>> getSimilarMovies(int movieId) {
    return remoteDataSource.getSimilarMovies(movieId);
  }

  @override
  Future<List<Movie>> searchMovies(String query) {
    return remoteDataSource.searchMovies(query);
  }
}
