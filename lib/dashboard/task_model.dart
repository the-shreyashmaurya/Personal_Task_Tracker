class TaskModel {
  int? id;
  String userId;
  String title;
  String description;
  bool status;
  DateTime createdAt;

  TaskModel({
    this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.status,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      "userId" : userId,
      'title': title,
      'description': description,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      userId: map['userId'],
      title: map['title'],
      description: map['description'],
      status: map['status'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
