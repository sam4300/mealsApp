import 'package:flutter/material.dart';
import '/screens/categories_screen.dart';
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
              )
          )

      ),
      routes: {
        '/': (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen()

    },
    );
  }
}
