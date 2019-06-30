import 'package:flutter/material.dart';
import '../widgets/button.dart';
import '../utils/LoginPost.dart';

class LoginPage extends StatefulWidget {
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginPost loginPostRequest;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String _validateUsername (String value) {
    if (value.isEmpty) {
      return 'Enter username';
    }
  }

  String _validatePassword (String value) {
    if (value.isEmpty) {
      return 'Enter password';
    }
  }

  void _sendRequest() {
    if (_formKey.currentState.validate()) {
      loginPostRequest = new LoginPost(username: usernameController.text, password: passwordController.text);
      loginPostRequest.createPost('https://mysterious-atoll-59667.herokuapp.com/api/login', body: loginPostRequest.toMap());
    }
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width*(0.75),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter username'
                  ),
                  validator: _validateUsername,
                  controller: usernameController,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*(0.75),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter password'
                  ),
                  validator: _validatePassword,
                  controller: passwordController,
                ),
              ),
              SizedBox(height: 70),
              Button(() => _sendRequest(), style, 'Confirm')
            ],
          )
        ),
      )
    );
  }
}