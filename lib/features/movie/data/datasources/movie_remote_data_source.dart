import 'package:dio/dio.dart';

import '../models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getPopularMovies();
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
}
