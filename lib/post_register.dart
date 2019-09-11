class PostRegister {
final String email;
final String username;
final String password_hash;


PostRegister({this.email, this.username, this.password_hash});

factory PostRegister.fromJson(Map<String, dynamic> json) {
return PostRegister(
  email: json['email'],
  username: json['username'],
  password_hash: json['password_hash'],
);
}

Map toMap() {
  var map = new Map<String, dynamic>();
  map["email"] = email;
  map["username"] = username;
  map["password_hash"] = password_hash;

  return map;
}
}