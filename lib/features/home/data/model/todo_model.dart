class TodoModel {
  String id;
  String description;

  TodoModel({
    required this.id,
    required this.description,
  });
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'].toString(),
      description: json['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "description": description,
    };
  }
}
