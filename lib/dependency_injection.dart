import 'package:get_it/get_it.dart';
import 'package:mymovies/core/services/dio_client.dart';
import 'package:mymovies/features/movie/data/datasources/movie_remote_data_source.dart';
import 'package:mymovies/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:mymovies/features/movie/domain/repositories/movie_repository.dart';
import 'package:mymovies/features/movie/domain/usecases/get_movie_detail.dart';
import 'package:mymovies/features/movie/domain/usecases/get_popular_movie.dart';
import 'package:mymovies/features/movie/domain/usecases/get_similiar_movie.dart';
import 'package:mymovies/features/movie/domain/usecases/search_movies.dart';
import 'package:mymovies/features/movie/presentation/blocs/detail_movie_bloc.dart';
import 'package:mymovies/features/movie/presentation/blocs/popular_movie_bloc.dart';
import 'package:mymovies/features/movie/presentation/blocs/serach_movie_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Dio
  sl.registerLazySingleton(() => DioClient().dio);

  // ===== Popular Movie =====
  // DataSource
  sl.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));

  // UseCase
  sl.registerLazySingleton(() => GetPopularMovies(sl()));

  // Bloc
  sl.registerFactory(() => PopularMoviesBloc(sl()));

  // ===== Detail Movie =====
  sl.registerLazySingleton(() => GetMovieDetail(sl()));

  sl.registerFactory(
    () => MovieDetailBloc(sl<GetMovieDetail>(), sl<GetSimilarMovies>()),
  );

  sl.registerLazySingleton(() => GetSimilarMovies(sl()));

  sl.registerLazySingleton(() => SearchMovies(sl()));

  sl.registerFactory(() => SearchMovieBloc(sl()));
}
