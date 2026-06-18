// lib/features/movie/presentation/widgets/search_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymovies/core/themes/app_colors.dart';
import 'package:mymovies/features/movie/presentation/blocs/search_movie_event.dart';
import 'package:mymovies/features/movie/presentation/blocs/serach_movie_bloc.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        cursorColor: AppColors.primary,
        onChanged: (value) {
          if (value.trim().isNotEmpty) {
            context.read<SearchMovieBloc>().add(SearchMovie(value));
          }
        },
        decoration: InputDecoration(
          fillColor: Colors.white.withOpacity(0.1),
          suffixStyle: const TextStyle(color: Colors.white),
          focusColor: AppColors.primary,
          hintText: "Search movies...",
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.6),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white.withOpacity(0.6),
          ),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.3),
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: AppColors.primary,
              width: 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.red, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
        ),
      ),
    );
  }
}