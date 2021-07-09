class CourseModel {
  final int id;
  final String name;
  final String professorId;
  final String createdAt;
  final String updatedAt;

  CourseModel({
    this.id,
    this.name,
    this.professorId,
    this.createdAt,
    this.updatedAt,
  });

  factory CourseModel.fromJson(Map<String, dynamic> data) {
    return CourseModel(
      id: data["id"],
      name: data["name"],
      createdAt: data["created_at"],
      professorId: data["id_professor"],
      updatedAt: data["updated_at"],
    );
  }
}
