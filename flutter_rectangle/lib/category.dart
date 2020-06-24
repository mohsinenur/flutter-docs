import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutterrectangle/converter_route.dart';
import 'package:flutterrectangle/unit.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Category extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;
  final List<Unit> units;

  const Category(
      {Key key,
      @required this.name,
      @required this.color,
      @required this.iconLocation,
      @required this.units})
      : assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        assert(units != null),
        super(key: key);

  void _navigateToConverter(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            name,
            style: Theme.of(context).textTheme.display2,
          ),
          centerTitle: true,
          backgroundColor: color,
        ),
        body: ConverterRoute(
          color: color,
          units: units,
        ),
        backgroundColor: color,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: _rowHeight,
        child: InkWell(
          onTap: () {
            _navigateToConverter(context);
          },
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  iconLocation,
                  size: 60,
                ),
              ),
              Center(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
