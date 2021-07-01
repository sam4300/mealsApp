import 'package:flutter/material.dart';
import 'package:meals_flutter/items/meal_item.dart';
import 'package:meals_flutter/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet'),
      );
    }
    else {
return ListView.builder(
    itemBuilder: (ctx, index) {
      return MealItem(
        id: favoriteMeals![index].id,
        affordability: favoriteMeals![index].affordability,
        complexity: favoriteMeals![index].complexity,
        title: favoriteMeals![index].title,
        duration: favoriteMeals![index].duration,
        imageUrl: favoriteMeals![index].imageUrl,
      );
    },
    itemCount: favoriteMeals!.length);
    }
    }
  }
