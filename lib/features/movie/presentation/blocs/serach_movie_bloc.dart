import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymovies/features/movie/domain/usecases/search_movies.dart';
import 'package:mymovies/features/movie/presentation/blocs/search_movie_state.dart';
import 'search_movie_event.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovies searchMovies;

  SearchMovieBloc(this.searchMovies) : super(SearchMovieInitial()) {
    on<SearchMovie>(_onSearch);
  }

  Future<void> _onSearch(
    SearchMovie event,
    Emitter<SearchMovieState> emit,
  ) async {
    emit(SearchMovieLoading());

    try {
      final movies = await searchMovies(event.query);

      emit(SearchMovieLoaded(movies));
    } catch (e) {
      emit(SearchMovieError(e.toString()));
    }
  }
}
