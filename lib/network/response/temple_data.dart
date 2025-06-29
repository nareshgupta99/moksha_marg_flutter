class TempleData {
  String? id;
  String? name;
  String? streetAddress;
  String? city;
  String? image;
  String? livelink;
  String? longitude;
  String? latitude;

  TempleData(
      {this.id,
      this.name,
      this.streetAddress,
      this.city,
      this.image,
      this.livelink,
      this.latitude,
      this.longitude});

  factory TempleData.fromJson(Map<String, dynamic> json) => TempleData(
        id: json["id"],
        name: json["name"],
        streetAddress: json["streetAddress"],
        city: json["city"],
        image: json["image"],
        livelink: json["livelink"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "streetAddress": streetAddress,
        "city": city,
        "image": image,
        "latitude": livelink,
        "livelink": latitude,
        "longitude": longitude,
      };
}
