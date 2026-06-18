import 'package:dio/dio.dart';
import 'package:mymovies/features/movie/data/models/movie_detail_model.dart';

import '../models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getPopularMovies();
  Future<MovieDetailModel> getMovieDetail(int movieId);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSourceImpl(this.dio);

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await dio.get('/movie/popular');

    final results = response.data['results'] as List;

    return results.map((e) => MovieModel.fromJson(e)).toList();
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    final response = await dio.get(
      '/movie/$movieId',
      queryParameters: {'language': 'en-US'},
    );

    return MovieDetailModel.fromJson(response.data);
  }
}
