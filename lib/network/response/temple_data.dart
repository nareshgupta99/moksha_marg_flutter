class TempleData {
  int? id;
  String? name;
  String? streetAddress;
  String? city;
  String? image;
  String? livelink;

  TempleData({
    this.id,
    this.name,
    this.streetAddress,
    this.city,
    this.image,
    this.livelink,
  });

  factory TempleData.fromJson(Map<String, dynamic> json) => TempleData(
        id: json["id"],
        name: json["name"],
        streetAddress: json["streetAddress"],
        city: json["city"],
        image: json["image"],
        livelink: json["livelink"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "streetAddress": streetAddress,
        "city": city,
        "image": image,
        "livelink": livelink,
      };
}
