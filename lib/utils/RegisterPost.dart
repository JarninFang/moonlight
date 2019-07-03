import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterPost {
  final String username;
  final String password;
  final String email;

  RegisterPost ({this.username, this.password, this.email});

  factory RegisterPost.fromJson(Map<String, dynamic> json) {
    return RegisterPost(
      username: json['username'],
      password: json['password'],
      email: json['email']
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = username;
    map["password"] = password;
    map["email"] = email;
 
    return map;
  }

  Future<RegisterPost> createPost(String url, {Map body}) async {
      var jsonBody = json.encode(body);
      print(jsonBody);
      return http.post(url, headers: {"Content-Type": "application/json"},
                            body: jsonBody).then((http.Response response) {
        final int statusCode = response.statusCode;
        if (statusCode == 200) {
          return RegisterPost.fromJson(json.decode(response.body));
        } else {
          throw new Exception("Error while fetching data");
        }
      });
    }
}