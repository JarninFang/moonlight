import 'package:flutter/material.dart';
import 'screens/WelcomePage.dart';
import 'screens/Login.dart';
import 'screens/Register.dart';
import 'screens/HomePage.dart'

void main() => runApp(App());

class App extends StatelessWidget {
  var routes = <String, WidgetBuilder>{
    "/Login": (BuildContext context) => new LoginPage(),
    "/Register": (BuildContext context) => new RegisterPage(),
    "/WelcomePage": (BuildContext context) => new WelcomePage(),
    "/HomePage": (BuildContext context) => new HomePage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moonlight',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(title: 'Moonlight'),
      routes: routes
    );
  }
}