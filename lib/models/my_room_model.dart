class MyCourseModel {
  final int id;
  final int isAcceptable;
  final String roomId;
  String roomName;
  final String studentId;
  final String professorId;
  final String createdAt;
  final String updatedAt;

  MyCourseModel({
    this.id,
    this.isAcceptable,
    this.roomId,
    this.roomName,
    this.studentId,
    this.professorId,
    this.createdAt,
    this.updatedAt,
  });

  factory MyCourseModel.fromJson(Map<String, dynamic> data) {
    return MyCourseModel(
      id: data["id"],
      isAcceptable: data["is_acceptable"],
      roomId: data["id_room"],
      roomName: "",
      studentId: data["id_student"],
      createdAt: data["created_at"],
      professorId: data["id_professor"],
      updatedAt: data["updated_at"],
    );
  }
}
