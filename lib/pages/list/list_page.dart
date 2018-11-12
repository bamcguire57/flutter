import 'package:flutter/material.dart';

import 'package:jool/drawer.dart';

class ListPage extends StatefulWidget {
  final String startingBird;

  ListPage({this.startingBird = 'Goose'});

  @override
  State<StatefulWidget> createState() {
    return _ListPageState();
  }
}

class _ListPageState extends State<ListPage> {
  List<String> _birds = [];

  @override
  void initState() {
    _birds.add(widget.startingBird);
    super.initState();
  }

  void _addBird(String bird) {
    setState(() {
      _birds.add(bird);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lists'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/login');
            },
            child: Icon(Icons.power_settings_new),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  _addBird('Duck');
                },
                child: Text('Add Product'),
              ),
            ),
            Column(
              children: _birds
                  .map((element) => Card(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.adb),
                            Text(element)
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
