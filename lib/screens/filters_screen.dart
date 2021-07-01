import 'package:flutter/material.dart';
import 'package:meals_flutter/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function setFilters;

  const FiltersScreen(
    this.setFilters,
  );

  static const routeName = '/filters-screen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;

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
        actions: [
          IconButton(
              onPressed: () {
                final Map<String ,bool> selectedFilters= {
                    'gluten': _isGlutenFree,
                    'lactose': _isLactoseFree,
                    'vegan': _isVegan,
                    'vegetarian': _isVegetarian,
                  };

                widget.setFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
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
          })
        ],
      ),
    );
  }
}
