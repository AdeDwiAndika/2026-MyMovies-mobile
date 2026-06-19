import 'package:equatable/equatable.dart';
import 'package:mymovies/features/movie/domain/entities/movie.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object?> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoritesLoaded extends FavoriteState {
  final List<Movie> favorites;

  const FavoritesLoaded(this.favorites);

  @override
  List<Object?> get props => [favorites];
}

class FavoriteAdded extends FavoriteState {
  final Movie movie;

  const FavoriteAdded(this.movie);

  @override
  List<Object?> get props => [movie];
}

class FavoriteRemoved extends FavoriteState {
  final int movieId;

  const FavoriteRemoved(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

class FavoriteChecked extends FavoriteState {
  final bool isFavorite;

  const FavoriteChecked(this.isFavorite);

  @override
  List<Object?> get props => [isFavorite];
}

class FavoriteError extends FavoriteState {
  final String message;

  const FavoriteError(this.message);

  @override
  List<Object?> get props => [message];
}