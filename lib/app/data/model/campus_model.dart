class Campus {
  int id;
  String name;

  Campus({
    required this.id,
    required this.name,
  });

  factory Campus.fromJson(Map<String, dynamic> json) {
    return Campus(
      id: json["id"],
      name: json["name"],
    );
  }
}
