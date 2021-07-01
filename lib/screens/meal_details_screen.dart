import 'package:flutter/material.dart';
import 'package:meals_flutter/dummy_data.dart';

class MealsDetails extends StatefulWidget {
  const MealsDetails({Key? key}) : super(key: key);

  static const routeName = '/meals-details-screen';

  @override
  _MealsDetailsState createState() => _MealsDetailsState();
}

class _MealsDetailsState extends State<MealsDetails> {
  Widget builderIngredientsTitle(BuildContext context, String title) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ));
  }

  Widget builderContainer(Widget child) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(20),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeData =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final title = routeData['title'];
    final imageUrl = routeData['imageUrl'];
    final id = routeData['id'];
    final selectedMeals = DUMMY_MEALS.firstWhere((map) => map.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text('$title '),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                '$imageUrl',
                fit: BoxFit.cover,
              ),
            ),
            builderIngredientsTitle(context, 'Ingredients'),
            builderContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Text('${selectedMeals.ingredients[index]} '),
                ),
                itemCount: selectedMeals.ingredients.length,
              ),
            ),
            builderIngredientsTitle(context, 'Steps'),
            builderContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text('${selectedMeals.steps[index]}'),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
                itemCount: selectedMeals.steps.length,
              ),
            ),
            FloatingActionButton(onPressed: (){
              Navigator.of(context).pop(id);
            },
            child: Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
