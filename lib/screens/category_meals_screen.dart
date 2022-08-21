import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rest_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String id;
  // final String title;
  // CategoryMealsScreen(this.id, this.title);
  static String routename = '/category-meals-screen';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String? id = routeArgs['id'];
    final String? title = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(id);
    }).toList();
    return Scaffold(
        appBar: AppBar(title: Text('Recipie for ${title} meals')),
        body: ListView.builder(
            itemBuilder: (context, index) {
              return MealItem(
                  id: categoryMeals[index].id,
                  title: categoryMeals[index].title,
                  imageUrl: categoryMeals[index].imageUrl,
                  duration: categoryMeals[index].duration,
                  complexity: categoryMeals[index].complexity,
                  affordability: categoryMeals[index].affordability);
            },
            itemCount: categoryMeals.length));
  }
}
