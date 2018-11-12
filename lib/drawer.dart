import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Home'),
              trailing: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pushNamed('/home');
              },
            ),
            ListTile(
              title: Text('Animations!'),
              trailing: Icon(Icons.play_arrow),
              onTap: () {
                Navigator.of(context).pushNamed('/animation');
              },
            ),
            ListTile(
              title: Text('Lists!'),
              trailing: Icon(Icons.list),
              onTap: () {
                Navigator.of(context).pushNamed('/list');
              },
            ),
          ],
        )
    );
  }
}
