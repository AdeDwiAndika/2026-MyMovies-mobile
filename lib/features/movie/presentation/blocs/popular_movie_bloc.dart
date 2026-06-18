import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymovies/features/movie/domain/usecases/get_popular_movie.dart';
import 'package:mymovies/features/movie/presentation/blocs/popular_movie_event.dart';
import 'package:mymovies/features/movie/presentation/blocs/popular_movie_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;

  PopularMoviesBloc(this.getPopularMovies) : super(PopularMoviesInitial()) {
    on<FetchPopularMovies>(_onFetch);
  }

  Future<void> _onFetch(
    FetchPopularMovies event,
    Emitter<PopularMoviesState> emit,
  ) async {
    emit(PopularMoviesLoading());

    try {
      final movies = await getPopularMovies();

      emit(PopularMoviesLoaded(movies));
    } catch (e) {
      emit(PopularMoviesError(e.toString()));
    }
  }
}
