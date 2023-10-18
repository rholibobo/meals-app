// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, unnecessary_cast

import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.saveFilters, this.currentFilters, {super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian= false;
  var _vegan= false;
  var _lactoseFree= false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'] ?? false ;
    _lactoseFree = widget.currentFilters['lactose'] ?? false;
    _vegan = widget.currentFilters['vegan'] ?? false;
    _vegetarian = widget.currentFilters['vegetarian'] ?? false;
    super.initState();
  }

  Widget _buildSwitchListTile(
    bool currentValue,
    Function updateValue,
    String title,
    String description,
  ) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue as Function(bool),
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'glutten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
                'Gluten-free',
                'Only include gluten-free meals',
              ),
              _buildSwitchListTile(
                _lactoseFree,
                (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
                'Lactose-free',
                'Only include lactose-free meals',
              ),
              _buildSwitchListTile(
                _vegetarian,
                (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
                'Vegetarian',
                'Only include vegetarian meals',
              ),
              _buildSwitchListTile(
                _vegan,
                (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
                'Vegan',
                'Only include vegan meals',
              ),
            ],
          ))
        ],
      ),
    );
  }
}
