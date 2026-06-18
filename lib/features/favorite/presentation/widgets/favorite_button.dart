// features/favorite/presentation/widgets/favorite_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymovies/features/favorite/presentation/blocs/favorit_bloc.dart';
import 'package:mymovies/features/favorite/presentation/blocs/favorit_event.dart';
import 'package:mymovies/features/favorite/presentation/blocs/favorit_state.dart';
import 'package:mymovies/features/movie/domain/entities/movie.dart';

class FavoriteButton extends StatelessWidget {
  final Movie movie;

  const FavoriteButton({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        bool isFavorite = false;

        if (state is FavoriteChecked) {
          isFavorite = state.isFavorite;
        } else if (state is FavoritesLoaded) {
          isFavorite = state.favorites.any((m) => m.id == movie.id);
        }

        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.white,
            size: 24,
          ),
          onPressed: () {
            if (isFavorite) {
              context.read<FavoriteBloc>().add(
                RemoveFavoriteEvent(movie.id),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Removed from favorites'),
                  duration: Duration(seconds: 1),
                ),
              );
            } else {
              context.read<FavoriteBloc>().add(AddFavoriteEvent(movie));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Added to favorites'),
                  duration: Duration(seconds: 1),
                ),
              );
            }
          },
        );
      },
    );
  }
}

// class _FavoriteButtonState extends State<FavoriteButton> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<FavoriteBloc>().add(CheckFavoriteEvent(widget.movie.id));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FavoriteBloc, FavoriteState>(
//       builder: (context, state) {
//         bool isFavorite = false;

//         if (state is FavoriteChecked) {
//           isFavorite = state.isFavorite;
//         } else if (state is FavoritesLoaded) {
//           isFavorite = state.favorites.any((m) => m.id == widget.movie.id);
//         }

//         return IconButton(
//           icon: Icon(
//             isFavorite ? Icons.favorite : Icons.favorite_border,
//             color: isFavorite ? Colors.red : Colors.white,
//             size: 24,
//           ),
//           onPressed: () {
//             if (isFavorite) {
//               context.read<FavoriteBloc>().add(
//                 RemoveFavoriteEvent(widget.movie.id),
//               );
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text('Removed from favorites'),
//                   duration: Duration(seconds: 1),
//                 ),
//               );
//             } else {
//               context.read<FavoriteBloc>().add(AddFavoriteEvent(widget.movie));
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text('Added to favorites'),
//                   duration: Duration(seconds: 1),
//                 ),
//               );
//             }
//           },
//         );
//       },
//     );
//   }
// }
