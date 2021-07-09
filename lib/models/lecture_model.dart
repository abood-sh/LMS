class LectureModel {
  final int id;
  final String roomId;
  final String name;
  final String createdAt;
  final String updatedAt;
  final String data;

  LectureModel({
    this.id,
    this.roomId,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.data,
  });

  factory LectureModel.fromJson(Map<String, dynamic> data) {
    return LectureModel(
      id: data["id"],
      roomId: data["id_room"],
      name: data["name"],
      createdAt: data["created_at"],
      updatedAt: data["updated_at"],
      data: data["data"],
    );
  }
}
