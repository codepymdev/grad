class ClasssModel {
  final name;
  final id;
  final arm;

  ClasssModel({
    required this.id,
    required this.name,
    required this.arm,
  });

  factory ClasssModel.fromJson(Map<String, dynamic> json) => ClasssModel(
        id: json['id'],
        name: json['name'],
        arm: json['arm'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "arm": arm,
      };
}
