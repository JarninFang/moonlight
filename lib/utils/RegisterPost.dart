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
}