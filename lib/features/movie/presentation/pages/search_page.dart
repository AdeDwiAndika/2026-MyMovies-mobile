import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymovies/features/movie/presentation/blocs/search_movie_state.dart';
import 'package:mymovies/features/movie/presentation/blocs/serach_movie_bloc.dart';
import 'package:mymovies/features/movie/presentation/widgets/movie_list_item.dart';
import 'package:mymovies/features/movie/presentation/widgets/search_bar.dart';
import 'package:mymovies/shared/custom_app_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        title: "MyMovies",
        showProfile: true,
        onProfileTap: () {},
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SearchBarWidget(),

            Expanded(
              child: BlocBuilder<SearchMovieBloc, SearchMovieState>(
                builder: (context, state) {
                  if (state is SearchMovieLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is SearchMovieLoaded) {
                    if (state.movies.isEmpty) {
                      return const Center(
                        child: Text(
                          "No movies found",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        final movie = state.movies[index];
                        return MovieListItem(movie: movie);
                      },
                    );
                  }

                  return const Center(
                    child: Text(
                      "Search your favorite movie",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
