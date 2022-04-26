class SubjectCategoriesModel {
  final name;
  final id;

  SubjectCategoriesModel({
    required this.id,
    required this.name,
  });

  factory SubjectCategoriesModel.fromJson(Map<String, dynamic> json) =>
      SubjectCategoriesModel(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
