class LoginData {
  int? userId;
  String? name;
  String? email;
  String? type;
  String? token;
  String? roles;

  LoginData({
    this.userId,
    this.name,
    this.email,
    this.type,
    this.token,
    this.roles
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        userId: json["userId"],
        name: json["name"],
        email: json["email"],
        type: json["type"],
        token: json["token"],
        roles:json["roles"]
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "email": email,
        "type": type,
        "token": token,
        "roles": roles,

      };
}
