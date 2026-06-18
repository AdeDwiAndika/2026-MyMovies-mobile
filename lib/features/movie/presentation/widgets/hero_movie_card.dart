import 'package:flutter/material.dart';
import 'package:mymovies/core/config/api_config.dart';
import 'package:mymovies/features/movie/presentation/pages/movie_detail_page.dart';

class HeroMovieCard extends StatelessWidget {
  final dynamic movie;

  const HeroMovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Image.network(
              "${ApiConfig.imageBaseUrl}${movie.posterPath}",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.95)],
              ),
            ),
          ),

          Positioned(
            left: 20,
            right: 20,
            bottom: 40,
            child: Column(
              children: [
                Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5669FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MovieDetailPage(movieId: movie.id),
                      ),
                    );
                  },
                  child: const Text(
                    "Watch Now",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
