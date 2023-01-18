class SubjectModel {
  int id;
  String name;
  bool checked;

  SubjectModel({
    required this.id,
    required this.name,
    this.checked = false,
  });
}
