import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rest_app/screens/meal-detail-screen.dart';
import 'package:rest_app/screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          // accentColor: Colors.amber,
          fontFamily: 'Raleway',
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            // titleLarge:
            //     TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'))
          ),
          canvasColor: Color.fromRGBO(255, 254, 229, 1)),
      //  home: CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const TabsScreen(),
        CategoryMealsScreen.routename: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
      },
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (context) => CategoryScreen());
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoryScreen());
      },
    );
  }
}
