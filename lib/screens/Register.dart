import 'package:flutter/material.dart';
import '../widgets/button.dart';

class RegisterPage extends StatefulWidget {
  
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
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
            Container(
              width: MediaQuery.of(context).size.width*(0.75),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter email'
                ),
              ),
            ),
            SizedBox(height: 70),
            Button(() => {}, style, 'Create Account')
          ],
          
        )
        
      ),
    );
  }
}