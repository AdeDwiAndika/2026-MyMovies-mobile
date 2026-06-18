import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mymovies/dependency_injection.dart';
import 'package:mymovies/features/auth/presentation/pages/login_page.dart';
import 'package:mymovies/features/auth/presentation/pages/splash_screen.dart';
import 'package:mymovies/features/favorite/presentation/blocs/favorit_bloc.dart';
import 'package:mymovies/features/movie/presentation/blocs/popular_movie_bloc.dart';
import 'package:mymovies/features/movie/presentation/blocs/serach_movie_bloc.dart';
import 'package:mymovies/features/navigator/prensetation/pages/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<PopularMoviesBloc>()),
        BlocProvider(create: (_) => sl<SearchMovieBloc>()),
        BlocProvider(create: (_) => sl<FavoriteBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'MyMovies',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.red),
          textTheme: GoogleFonts.dmSansTextTheme(),
        ),
        home: const SplashPage(),
        routes: {
          MainPage.routeName: (context) => const MainPage(),
          LoginPage.routeName: (context) => const LoginPage(),
        },
      ),
    );
  }
}
