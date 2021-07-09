class UserModel {
  final int userId;
  String userName;
  String userEmail;
  String userPassword;

  UserModel({
    this.userId,
    this.userName,
    this.userEmail,
    this.userPassword,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      userId: data["userId"],
      userName: data["userName"],
      userEmail: data["userEmail"],
      userPassword: data["userPassword"],
    );
  }

  toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'userPassword': userPassword,
    };
  }
}
