// api's const

import 'package:get_storage/get_storage.dart';

const String getAllRoomsAPI =
    "http://www.glory.palgooal.com/MLS/public/API/getRooms";

String loginAPI(String email, String password) {
  return "http://www.glory.palgooal.com/MLS/public/API/LOGIN/$email/$password";
}

String getLecturesRoomAPI(int roomId) {
  return "http://www.glory.palgooal.com/MLS/public/API/getLucturesRoom/$roomId";
}

String getAcceptableRoomAPI(int userId) {
  return "http://www.glory.palgooal.com/MLS/public/API/rooms_user_accept/$userId";
}

String getNotAcceptableRoomAPI(int userId) {
  return "http://www.glory.palgooal.com/MLS/public/API/rooms_user_not_accept/$userId";
}

String getRegisterRoomAPI(int userId, int profId, String roomId) {
  return "http://www.glory.palgooal.com/MLS/public/API/reisterUserRoom/$roomId/$userId/$profId";
}

String getDeleteRoomAPI(int roomId) {
  return "http://www.glory.palgooal.com/MLS/public/API/deleteStudentRoom/$roomId";
}

String getEditProfileAPI(int userId, String name, String email) {
  return "http://www.glory.palgooal.com/MLS/public/API/updateProfile/$userId/$name/$email";
}

String getEditProfilePasswordAPI(int userId, String password) {
  return "http://www.glory.palgooal.com/MLS/public/API/updateProfilePass/$userId/$password";
}

String getRegisterUserAPI(int roomId, int stuId, String profId) {
  return "http://www.glory.palgooal.com/MLS/public/API/reisterUserRoom/$roomId/$stuId/$profId";
}

// vairables const
final box = GetStorage();
