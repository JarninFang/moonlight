import 'package:flutter/material.dart';
import '../widgets/button.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {

    _onLoginButtonPress() {
      Navigator.pushNamed(
        context,
        '/Login'
      );
    }

    _onRegisterButtonPress() {
      Navigator.pushNamed(
        context,
        '/Register'
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Moonlight',
              style: Theme.of(context).textTheme.display1,
            ),
            SizedBox(height: 70.0),
            Button(() => _onRegisterButtonPress(), style, 'Register'),
            SizedBox(height: 70.0),
            Button(() => _onLoginButtonPress(), style, 'Login')
          ],
        ),

      ),
    );
  }
}
