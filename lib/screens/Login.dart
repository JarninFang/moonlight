import 'package:flutter/material.dart';
import '../widgets/button.dart';

class LoginPage extends StatefulWidget {
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width*(0.75),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter username'
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*(0.75),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter password'
                ),
              ),
            ),
            SizedBox(height: 70),
            Button(() => {}, style, 'Confirm')
          ],
          
        )
        
      ),
    );
  }
}