import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymovies/features/movie/domain/usecases/get_movie_detail.dart';
import 'package:mymovies/features/movie/presentation/blocs/detail_movie_event.dart';
import 'package:mymovies/features/movie/presentation/blocs/detail_movie_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;

  MovieDetailBloc(this.getMovieDetail) : super(MovieDetailInitial()) {
    on<FetchMovieDetail>(_onFetch);
  }

  Future<void> _onFetch(
    FetchMovieDetail event,
    Emitter<MovieDetailState> emit,
  ) async {
    emit(MovieDetailLoading());

    try {
      final result = await getMovieDetail(event.movieId);

      emit(MovieDetailLoaded(result));
    } catch (e) {
      emit(MovieDetailError(e.toString()));
    }
  }
}
