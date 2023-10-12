// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealScreen(this.categoryId, this.categoryTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: Center(
          child: Text(
        'The Recipes for the Category',
      )),
    );
  }
}
