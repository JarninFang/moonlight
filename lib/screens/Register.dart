import 'package:flutter/material.dart';
import '../widgets/button.dart';
import '../utils/RegisterPost.dart';

class RegisterPage extends StatefulWidget {
  
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RegisterPost registerPostRequest;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
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

  String _validateEmail (String value) {
    if (value.isEmpty) {
      return 'Enter email';
    }
  }

  void _sendRequest() {
    if (_formKey.currentState.validate()) {
      registerPostRequest = new RegisterPost(username: usernameController.text, password: passwordController.text, email: emailController.text);
      registerPostRequest.createPost('https://mysterious-atoll-59667.herokuapp.com/api/register', body: registerPostRequest.toMap());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
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
              Container(
                width: MediaQuery.of(context).size.width*(0.75),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter email'
                  ),
                  validator: _validateEmail,
                  controller: emailController,
                ),
              ),
              SizedBox(height: 70),
              Button(() => _sendRequest(), style, 'Create Account')
            ],
          )
        ),
      ),
    );
  }
}