class ClassCategoriesModel {
  final name;
  final id;

  ClassCategoriesModel({
    required this.id,
    required this.name,
  });

  factory ClassCategoriesModel.fromJson(Map<String, dynamic> json) =>
      ClassCategoriesModel(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
