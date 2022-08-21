import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rest_app/models/meal.dart';
import 'package:rest_app/screens/meal-detail-screen.dart';

enum complexity {
  Simple,
  Challenging,
  Hard,
}

enum affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String id;

  MealItem(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability});

  String get AffordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;

      case Affordability.Luxurious:
        return 'Expensive';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'unknown';
    }
  }

  String get ComplexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;

      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'unknown';
    }
  }

  void SelectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Stack(children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                top: 200,
                child: Container(
                    color: Colors.black54,
                    child: FittedBox(
                        child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 10),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ))))
          ]),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [Icon(Icons.schedule), Text('${duration} min')],
                ),
                Row(
                  children: [Icon(Icons.work), Text(ComplexityText)],
                ),
                Row(
                  children: [Icon(Icons.attach_money), Text(AffordabilityText)],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
