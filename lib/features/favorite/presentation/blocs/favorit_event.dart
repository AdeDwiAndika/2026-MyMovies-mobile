import 'package:equatable/equatable.dart';
import 'package:mymovies/features/movie/domain/entities/movie.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object?> get props => [];
}

class LoadFavorites extends FavoriteEvent {}

class AddFavoriteEvent extends FavoriteEvent {
  final Movie movie;

  const AddFavoriteEvent(this.movie);

  @override
  List<Object?> get props => [movie];
}

class RemoveFavoriteEvent extends FavoriteEvent {
  final int movieId;

  const RemoveFavoriteEvent(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

class CheckFavoriteEvent extends FavoriteEvent {
  final int movieId;

  const CheckFavoriteEvent(this.movieId);

  @override
  List<Object?> get props => [movieId];
}