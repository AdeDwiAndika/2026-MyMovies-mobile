import 'package:flutter/material.dart';
import 'package:mymovies/features/favorite/presentation/pages/favorite_page.dart';
import 'package:mymovies/features/movie/presentation/pages/home_page.dart';
import 'package:mymovies/features/movie/presentation/pages/search_page.dart';
import '../widgets/bottom_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const String routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> _pages = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _pages = [
      HomePage(),
      SearchPage(),
      FavoritesPage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
