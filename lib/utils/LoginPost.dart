
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPost
 {
  final String username;
  final String password;

  LoginPost
   ({this.username, this.password});

  factory LoginPost
  .fromJson(Map<String, dynamic> json) {
    return LoginPost
    (
      username: json['username'],
      password: json['password'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = username;
    map["password"] = password;

    return map;
  }

  Future<LoginPost> createPost(String url, {Map body}) async {
      var jsonBody = json.encode(body);
      print(jsonBody);
      return http.post(url, headers: {"Content-Type": "application/json"},
                            body: jsonBody).then((http.Response response) {
        final int statusCode = response.statusCode;
        print(response.body);
        print(response.statusCode);
        if (statusCode == 200 || statusCode == 401) {
          return LoginPost
          .fromJson(json.decode(response.body));
        } else {
          throw new Exception("Error while fetching data");
        }
      });
    }
}