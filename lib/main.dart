import 'package:flutter/material.dart';

import 'package:jool/pages/login/login_page.dart';
import 'package:jool/pages/home/home_page.dart';
import 'package:jool/pages/animation_page.dart';
import 'package:jool/pages/list/list_page.dart';

void main () =>  runApp(new MyApp());

final routes = {
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new HomePage(),
  '/animation': (BuildContext context) => new AnimationPage(),
  '/list': (BuildContext context) => new ListPage(),
  '/': (BuildContext context) => new LoginPage(),
};

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Jool Project',
      theme: new ThemeData(
        brightness: Brightness.dark
      ),
      routes: routes
    );
  }
}