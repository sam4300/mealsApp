import 'package:flutter/material.dart';
import 'package:meals_flutter/main_drawer.dart';
import 'package:meals_flutter/screens/categories_screen.dart';
import 'package:meals_flutter/screens/category_meals_screen.dart';

class FiltersScreen extends StatefulWidget {
  final Function setFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.setFilters, this.currentFilters);

  static const routeName = '/filters-screen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;

  @override
  initState() {
    _isGlutenFree = widget.currentFilters['gluten'] as bool;
    _isLactoseFree = widget.currentFilters['lactose'] as bool;
    _isVegan = widget.currentFilters['vegan'] as bool;
    _isVegetarian = widget.currentFilters['vegetarian'] as bool;

    super.initState();
  }

  Widget _buildSwitchListTile(String title, String subTitle, bool currentValue,
      Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Text(
              'Filter your meals here',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          _buildSwitchListTile(
              'Gluten-free', 'Only gluten free meals', _isGlutenFree,
              (newValue) {
            setState(() {
              _isGlutenFree = newValue;
            });
          }),
          _buildSwitchListTile(
              'Lactose-free', 'Only lactose free meals', _isLactoseFree,
              (newValue) {
            setState(() {
              _isLactoseFree = newValue;
            });
          }),
          _buildSwitchListTile('Vegan', 'Only vegan meals', _isVegan,
              (newValue) {
            setState(() {
              _isVegan = newValue;
            });
          }),
          _buildSwitchListTile(
              'Vegetarian', 'Only vegetarian meals', _isVegetarian, (newValue) {
            setState(() {
              _isVegetarian = newValue;
            });
          }),
          ElevatedButton(
              onPressed: () {
                final Map<String, bool> selectedFilters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian,
                };

                widget.setFilters(selectedFilters);
              },
              child: Text('Save'),),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
            child: Text('Updated Meals'),
          )
        ],
      ),
    );
  }
}
