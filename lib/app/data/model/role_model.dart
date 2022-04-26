class Role {
  final String id;
  final String name;
  final String type;
  final String perms;

  Role({
    required this.id,
    required this.name,
    required this.type,
    required this.perms,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        perms: json["perms"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "perms": perms,
      };
}
