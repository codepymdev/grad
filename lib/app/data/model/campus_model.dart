class Campus {
  final String id;
  final String name;
  final String address;
  final String tel;

  Campus({
    required this.id,
    required this.name,
    required this.address,
    required this.tel,
  });

  factory Campus.fromJson(Map<String, dynamic> json) => Campus(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        tel: json["tel"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "tel": tel,
      };
}
