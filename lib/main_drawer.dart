import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meals_flutter/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildDrawer(
      IconData icon, String title,VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Colors.black87,
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            height: 100,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                  fontSize: 25, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          buildDrawer(
            Icons.restaurant,
            'Meals',
              (){
              Navigator.of(context).pushReplacementNamed('/');
              }
          ),
          buildDrawer(
            Icons.settings,
            'Filters',
              (){
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
              }
          )
        ],
      ),
    );
  }
}
