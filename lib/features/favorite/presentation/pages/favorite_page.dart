import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymovies/features/favorite/presentation/blocs/favorit_bloc.dart';
import 'package:mymovies/features/favorite/presentation/blocs/favorit_event.dart';
import 'package:mymovies/features/favorite/presentation/blocs/favorit_state.dart';
import 'package:mymovies/features/movie/presentation/pages/movie_detail_page.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Favorites',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.black,
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FavoritesLoaded) {
            if (state.favorites.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite_border, size: 80, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'No favorites yet',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Start adding movies to your favorites',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.favorites.length,
              itemBuilder: (context, index) {
                final movie = state.favorites[index];
                return Card(
                  color: Colors.grey.shade900,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w200${movie.posterPath}",
                        width: 60,
                        height: 90,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 60,
                            height: 90,
                            color: Colors.grey.shade800,
                            child: const Icon(
                              Icons.movie,
                              color: Colors.grey,
                              size: 30,
                            ),
                          );
                        },
                      ),
                    ),
                    title: Text(
                      movie.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              movie.voteAverage.toStringAsFixed(1),
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 28,
                      ),
                      onPressed: () {
                        context.read<FavoriteBloc>().add(
                          RemoveFavoriteEvent(movie.id),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Removed from favorites'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MovieDetailPage(movieId: movie.id),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }

          if (state is FavoriteError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red.shade300,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.message,
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<FavoriteBloc>().add(LoadFavorites());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
