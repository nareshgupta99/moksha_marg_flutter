class AuthData {
    int? id;
    String? email;

    AuthData({
        this.id,
        this.email,
    });

    factory AuthData.fromJson(Map<String, dynamic> json) => AuthData(
        id: json["id"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
    };
}
