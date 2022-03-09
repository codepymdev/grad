class SchoolModel {
  final int id;
  final String name;
  final String slug;
  final String logo;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  SchoolModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.logo,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SchoolModel.fromJson(Map<String, dynamic> json) => SchoolModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        logo: json["logo"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "logo": logo,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
