import 'package:flutter/material.dart';
import 'package:meals_flutter/dummy_data.dart';
import 'package:meals_flutter/models/meal.dart';

import 'package:meals_flutter/screens/filters_screen.dart';
import 'package:meals_flutter/screens/meal_details_screen.dart';
import 'package:meals_flutter/screens/tabs_screen.dart';
import '/screens/category_meals_screen.dart';

void main() {
  runApp(MealApp());
}

class MealApp extends StatefulWidget {
  const MealApp({Key? key}) : super(key: key);

  @override
  _MealAppState createState() => _MealAppState();
}

class _MealAppState extends State<MealApp> {


  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];


  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeals.indexWhere((meal) =>
    meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }
    else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId ),);
      });
    }
  }
  bool _isMealFavorite(String id){
    return _favoriteMeals.any((meal)=> meal.id == id);
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 255, 235, 1),
          textTheme: ThemeData
              .light()
              .textTheme
              .copyWith(
              headline6: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
              ))),
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealsDetails.routeName: (ctx) => MealsDetails(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters, _filters)
      },
    );
  }
}
