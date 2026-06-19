import 'package:get_it/get_it.dart';
import 'package:mymovies/core/services/dio_client.dart';
import 'package:mymovies/core/utils/database_helper.dart';
import 'package:mymovies/features/favorite/data/datasources/movie_local_data_source.dart';
import 'package:mymovies/features/favorite/data/datasources/movie_local_data_source_impl.dart';
import 'package:mymovies/features/favorite/data/repositories/favorite_movie_repostiory_impl.dart';
import 'package:mymovies/features/favorite/domain/repositories/favorite_movie_repository.dart';
import 'package:mymovies/features/favorite/presentation/blocs/favorit_bloc.dart';
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
  sl.registerLazySingleton(() => DioClient().dio);

  sl.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));

  sl.registerLazySingleton(() => GetPopularMovies(sl()));

  sl.registerFactory(() => PopularMoviesBloc(sl()));

  sl.registerLazySingleton(() => GetMovieDetail(sl()));

  sl.registerFactory(
    () => MovieDetailBloc(sl<GetMovieDetail>(), sl<GetSimilarMovies>()),
  );

  sl.registerLazySingleton(() => GetSimilarMovies(sl()));

  sl.registerLazySingleton(() => SearchMovies(sl()));

  sl.registerFactory(() => SearchMovieBloc(sl()));

  sl.registerLazySingleton<FavoriteLocalDataSource>(
    () => FavoriteLocalDataSourceImpl(sl<DatabaseHelper>()),
  );

  sl.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(sl<FavoriteLocalDataSource>()),
  );

  sl.registerFactory(() => FavoriteBloc(sl<FavoriteRepository>()));

  sl.registerLazySingleton(() => DatabaseHelper());
}
