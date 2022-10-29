import 'package:flutter/material.dart';
import 'package:flutter_projeto_03_receitas/models/settings.dart';

import 'package:flutter_projeto_03_receitas/screens/categories_meals_screens.dart';
import 'package:flutter_projeto_03_receitas/screens/categories_screens.dart';
import 'package:flutter_projeto_03_receitas/screens/meal_detail_screen.dart';
import 'package:flutter_projeto_03_receitas/screens/settings_screen.dart';
import 'package:flutter_projeto_03_receitas/screens/tabs_screen.dart';
import 'utils/app_routes.dart';
import 'models/meals.dart';
import 'data/dummy_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  List<Meal> _favoriteMeals = [];
  List<Meal> _availableMeals = dummyMeals;
  Settings settings = Settings();

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = dummyMeals.where((meal) {
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterVegetarian && !filterVegan;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Receitas',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black45,
            fontFamily: 'RobotoCondensed-Light',
            fontSize: 16,
          ),
          bodySmall: TextStyle(
            color: Colors.green,
            fontFamily: 'Raleway-Regular',
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: TextStyle(
            color: Colors.black87,
            fontFamily: 'RobotoCondensed-Bold',
            fontSize: 18,
          ),
          titleSmall: TextStyle(
            color: Colors.white70,
            fontFamily: 'RobotoCondensed-italic',
            fontSize: 16,
            overflow: TextOverflow.fade,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.redAccent[100],
          centerTitle: true,
          toolbarTextStyle: const TextStyle(
              fontFamily: 'Raleway',
              fontSize: 26,
              wordSpacing: 3.0,
              color: Colors.white60),
        ),
      ),
      home: TabsScreen(_favoriteMeals),
      routes: {
        //AppRoutes.HOME: (ctx) => const CategoriesScreen(),
        AppRoutes.CATEGORIESMEALS: (context) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (context) =>
            MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.SETTINGS: (context) => SettingsScreen(_filterMeals, settings),
      },
      onUnknownRoute: ((settings) {
        return MaterialPageRoute(builder: (_) {
          return const CategoriesScreen();
        });
      }),
    );
  }
}
