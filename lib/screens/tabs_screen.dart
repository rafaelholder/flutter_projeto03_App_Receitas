import 'package:flutter/material.dart';
import 'package:flutter_projeto_03_receitas/models/meals.dart';
import 'package:flutter_projeto_03_receitas/screens/categories_screens.dart';
import 'package:flutter_projeto_03_receitas/screens/favorite_screen.dart';

import '../components/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.favoritesMeal, {super.key});
  final List<Meal> favoritesMeal;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  late List<Map<String, Object?>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Categorias',
        'screen': const CategoriesScreen(),
      },
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(widget.favoritesMeal),
      },
    ];
  }

  _selectedScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title'] as String),
        titleTextStyle: Theme.of(context).appBarTheme.toolbarTextStyle,
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).backgroundColor,
        onTap: _selectedScreen,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.indigo[800],
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).backgroundColor,
            icon: const Icon(Icons.content_paste_go),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).backgroundColor,
            icon: const Icon(Icons.star_border),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
