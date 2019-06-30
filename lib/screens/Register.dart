import 'package:flutter/material.dart';
import '../widgets/button.dart';
import 'package:http/http.dart' as http;
import '../utils/RegisterPost.dart';
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  
  @override
  Widget build(BuildContext context) {

    Future<http.Response> fetchPost() async {
      final response = await http.post('https://mysterious-atoll-59667.herokuapp.com/api/register');

      print(response.body.toString());
    }
    Future<RegisterPost> createPost(String url, {Map body}) async {
      var newBody = json.encode(body);
      return http.post(url, headers: {"Content-Type": "application/json"},
                            body: newBody).then((http.Response response) {
        final int statusCode = response.statusCode;
        if (statusCode == 200) {
          return RegisterPost.fromJson(json.decode(response.body));
        } else {
          throw new Exception("Error while fetching data");
        }
      });
    }
    RegisterPost newPost = new RegisterPost(username: "test", password: "test", email: "test");

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
            Button(() async => createPost('https://mysterious-atoll-59667.herokuapp.com/api/register', body: newPost.toMap()), style, 'Create Account')
          ],
          
        )
        
      ),
    );
  }
}