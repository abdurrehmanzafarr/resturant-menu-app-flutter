import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import '../screens/category_meals_screen.dart';
import 'package:flutter/src/widgets/framework.dart';

class categoryitem extends StatelessWidget {
  final Color color;
  final String title;
  final String id;
  categoryitem({required this.id, required this.color, required this.title});

  void SelectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routename,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (() => {SelectCategory(context)}),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Center(
              child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          )),
          // Align(alignment: Alignment.center, child: Text(title)),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [color.withOpacity(0.7), color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(15)),
        ));
  }
}
