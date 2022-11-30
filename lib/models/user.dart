class User {
  String? username;
  String? lastName;
  String? firstName;
  String? password;
  int? id;

  User(this.username, this.lastName, this.firstName, this.password, this.id);

  User.fromJson(Map<String, dynamic> json){
    username = json["username"];
    lastName = json["last_name"];
    firstName = json["first_name"];
    password = json["password"];
    id = json["id"];
  }
}