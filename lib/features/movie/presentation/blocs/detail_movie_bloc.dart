import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymovies/features/movie/domain/usecases/get_movie_detail.dart';
import 'package:mymovies/features/movie/domain/usecases/get_similiar_movie.dart';
import 'package:mymovies/features/movie/presentation/blocs/detail_movie_event.dart';
import 'package:mymovies/features/movie/presentation/blocs/detail_movie_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final GetSimilarMovies getSimilarMovies;

  MovieDetailBloc(this.getMovieDetail, this.getSimilarMovies)
    : super(MovieDetailInitial()) {
    on<FetchMovieDetail>(_onFetch);
  }

  Future<void> _onFetch(
    FetchMovieDetail event,
    Emitter<MovieDetailState> emit,
  ) async {
    emit(MovieDetailLoading());

    try {
      final movie = await getMovieDetail(event.movieId);

      final similarMovies = await getSimilarMovies(event.movieId);

      emit(MovieDetailLoaded(movie, similarMovies: similarMovies));
    } catch (e) {
      emit(MovieDetailError(e.toString()));
    }
  }
}
