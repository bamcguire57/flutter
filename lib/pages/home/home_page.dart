import 'package:flutter/material.dart';

//my files
import './dynamic.dart';
import 'package:jool/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
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
      body: DynamicContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'What\s hot?',
        child: Icon(Icons.whatshot),
      ),
    );
  }
}
