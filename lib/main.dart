// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';
import './screens/tabs_screen.dart';

import './screens/meal_detail_screen.dart';

import 'screens/category_meal_screen.dart';

import 'screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.pink,
            secondary: Colors.amber,
          ),
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleSmall: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ))),
      // home: CategoriesScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(),
      },
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      onUnknownRoute: ((settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      }),
    );
  }
}
