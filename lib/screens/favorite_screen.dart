import 'package:flutter/material.dart';
import 'package:flutter_projeto_03_receitas/components/meal_item.dart';
import 'package:flutter_projeto_03_receitas/models/meals.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoritesMeals;
  const FavoriteScreen(this.favoritesMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty) {
      return const Center(
        child: Text('Nenhuma comida favoritada'),
      );
    } else {
      return ListView.builder(
        itemCount: favoritesMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(favoritesMeals[index]);
        },
      );
    }
  }
}
