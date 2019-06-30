import 'package:flutter/material.dart';
import 'screens/HomePage.dart';
import 'screens/Login.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  var routes = <String, WidgetBuilder>{
    "/Login": (BuildContext context) => new LoginPage(),
    "/HomePage": (BuildContext context) => new HomePage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moonlight',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Moonlight'),
      routes: routes
    );
  }
}