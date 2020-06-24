import 'package:flutter/material.dart';
import 'package:flutterrectangle/category.dart';
import 'package:flutterrectangle/unit.dart';

class CategoryRoute extends StatelessWidget {
  final _backGroundColor = Colors.green[100];

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  static const _icons = [
    Icons.cake,
    Icons.android,
    Icons.print,
    Icons.ac_unit,
    Icons.add_a_photo,
    Icons.add_alarm,
    Icons.album,
    Icons.blur_circular
  ];

  Widget _buildCategoryWidgets(List<Widget> categories ) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categories[index],
      itemCount: categories.length,
    );
  }

  /// Returns a list of mock [Unit]s.
  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }



  @override
  Widget build(BuildContext context) {
    final categories = <Category>[];

    for(var i=0; i < _categoryNames.length; i++){
      categories.add(Category(
        name: _categoryNames[i],
        color: _baseColors[i],
        iconLocation: _icons[i],
        units: _retrieveUnitList(_categoryNames[i]),
      ));
    }

    final listView = Container(
      color: _backGroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(categories),
    );

    final appBar = AppBar(
      title: Text(
        'Unit Converter',
        style: TextStyle(color: Colors.black, fontSize: 30.0),
      ),
      centerTitle: true,
      backgroundColor: _backGroundColor,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
