import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymovies/features/favorite/domain/repositories/favorite_movie_repository.dart';
import 'package:mymovies/features/favorite/presentation/blocs/favorit_event.dart';
import 'package:mymovies/features/favorite/presentation/blocs/favorit_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepository repository;

  FavoriteBloc(this.repository) : super(FavoriteInitial()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<AddFavoriteEvent>(_onAddFavorite);
    on<RemoveFavoriteEvent>(_onRemoveFavorite);
    on<CheckFavoriteEvent>(_onCheckFavorite);
  }

  Future<void> _onLoadFavorites(
    LoadFavorites event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(FavoriteLoading());
    try {
      final favorites = await repository.getFavorites();
      emit(FavoritesLoaded(favorites));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  Future<void> _onAddFavorite(
    AddFavoriteEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      await repository.saveFavorite(event.movie);
      emit(FavoriteAdded(event.movie));
      final favorites = await repository.getFavorites();
      emit(FavoritesLoaded(favorites));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  Future<void> _onRemoveFavorite(
    RemoveFavoriteEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      await repository.removeFavorite(event.movieId);
      emit(FavoriteRemoved(event.movieId));
      final favorites = await repository.getFavorites();
      emit(FavoritesLoaded(favorites));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  Future<void> _onCheckFavorite(
    CheckFavoriteEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      final isFavorite = await repository.isFavorite(event.movieId);
      emit(FavoriteChecked(isFavorite));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }
}