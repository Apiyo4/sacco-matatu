
class PostLogin {
  final String email;
  final String password_hash;

  PostLogin({this.email, this.password_hash});

  factory PostLogin.fromJson(Map<String, dynamic> json) {
    return PostLogin(
      email: json['email'],
      password_hash: json['password_hash'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["email"] = email;
    map["password_hash"] = password_hash;
    return map;
  }
}
