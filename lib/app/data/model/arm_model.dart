class Arm {
  final String id;
  final String name;

  Arm({
    required this.id,
    required this.name,
  });

  factory Arm.fromJson(Map<String, dynamic> json) => Arm(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
