class Arm {
  int id;
  String name;

  Arm({
    required this.id,
    required this.name,
  });

  factory Arm.fromJson(Map<String, dynamic> json) => Arm(
        id: json["id"],
        name: json["name"],
      );
}
