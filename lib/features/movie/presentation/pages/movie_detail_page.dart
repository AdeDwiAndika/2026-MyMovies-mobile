import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymovies/dependency_injection.dart';
import 'package:mymovies/features/favorite/presentation/widgets/favorite_button.dart';
import 'package:mymovies/features/movie/presentation/blocs/detail_movie_bloc.dart';
import 'package:mymovies/features/movie/presentation/blocs/detail_movie_event.dart';
import 'package:mymovies/features/movie/presentation/blocs/detail_movie_state.dart';

class MovieDetailPage extends StatelessWidget {
  final int movieId;

  const MovieDetailPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MovieDetailBloc>()..add(FetchMovieDetail(movieId)),
      child: Scaffold(
        backgroundColor: const Color(0xFF09090F),
        body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }

            if (state is MovieDetailLoaded) {
              final movie = state.movie;
              final similarMovies = state.similarMovies;

              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 350,
                    pinned: true,
                    title: Text(
                      movie.title,
                      style: const TextStyle(color: Colors.white),
                    ),
                    centerTitle: true,
                    iconTheme: const IconThemeData(color: Colors.white),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                        "https://image.tmdb.org/t/p/w500${movie.backdropPath}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                movie.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              FavoriteButton(movie: movie)
                            ],
                          ),

                          const SizedBox(height: 10),

                          Text(
                            "⭐ ${movie.voteAverage}",
                            style: const TextStyle(color: Colors.grey),
                          ),

                          const SizedBox(height: 16),

                          Wrap(
                            spacing: 8,
                            children: movie.genres.map((genre) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.08),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.1),
                                  ),
                                ),
                                child: Text(
                                  genre,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),

                          const SizedBox(height: 20),

                          Text(
                            movie.overview,
                            style: const TextStyle(
                              color: Colors.white70,
                              height: 1.6,
                            ),
                          ),

                          SizedBox(height: 20),
                          Text(
                            "Similar Movies",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 16),

                          SizedBox(
                            height: 240,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: similarMovies.length,
                              itemBuilder: (context, index) {
                                final movie = similarMovies[index];

                                return Container(
                                  width: 130,
                                  margin: const EdgeInsets.only(right: 12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                          height: 180,
                                          width: 130,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        movie.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
