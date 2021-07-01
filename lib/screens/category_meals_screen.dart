import 'package:flutter/material.dart';

import 'package:meals_flutter/items/meal_item.dart';
import 'package:meals_flutter/models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
  static const routeName = '/category-meals-screen';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String? categoryTitle;
  Color? categoryColor;
  List<Meal>? displayedMeals ;
  @override
  void didChangeDependencies() {
    final routeArgs =
    ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
     categoryTitle = routeArgs['title'] as String;
    final categoryId = routeArgs['id'];
     categoryColor = routeArgs['color'] as Color;
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void removeItem(String id)
  {
    setState(() {
displayedMeals!.removeWhere((meal) => meal.id == id);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!.toString()),
        backgroundColor: categoryColor as Color,
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: displayedMeals![index].id,
                affordability: displayedMeals![index].affordability,
                complexity: displayedMeals![index].complexity,
                title: displayedMeals![index].title,
                duration: displayedMeals![index].duration,
                imageUrl: displayedMeals![index].imageUrl,
            );
          },
          itemCount: displayedMeals!.length),
    );
  }
}
