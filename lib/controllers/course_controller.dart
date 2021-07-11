import 'dart:convert';
import 'package:courses_app/config/app_constants.dart';
import 'package:courses_app/models/my_room_model.dart';
import 'package:courses_app/models/room_model.dart';
import 'package:courses_app/models/lecture_model.dart';
import 'package:courses_app/models/user_model.dart';
import 'package:courses_app/view/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CourseController extends GetxController
    with SingleGetTickerProviderMixin {
  RxList<CourseModel> allRooms = <CourseModel>[].obs;
  RxMap<String, List<LectureModel>> lectures =
      <String, List<LectureModel>>{}.obs;
  RxList<MyCourseModel> acceptableRooms = <MyCourseModel>[].obs;
  RxList<MyCourseModel> unAcceptableRooms = <MyCourseModel>[].obs;

  // loading when fetching rooms/lectures data
  RxBool isLoading = false.obs;
  // tab controller for my_courses page
  TabController tabController;
  // logged user data
  Rx<UserModel> user = UserModel().obs;
  RxInt userId = 0.obs;

  void getUserData() =>
      user.value = UserModel.fromMap(json.decode(box.read("user")));

  Future<void> getAllRooms() async {
    try {
      var url = Uri.parse(getAllRoomsAPI);
      var response = await http.get(url);
      var responseBody = jsonDecode(response.body);
      var roomsList = responseBody['room'] as List;
      allRooms.value = roomsList.map((e) => CourseModel.fromJson(e)).toList();
      print("allRooms :$allRooms");
    } catch (e) {
      print("error: ${e.toString()}");
    }
  }

  Future<void> getLecturesRoom(int roomId, String roomName) async {
    try {
      var url = Uri.parse(getLecturesRoomAPI(roomId));
      var response = await http.get(url);
      var responseBody = jsonDecode(response.body);
      var lecturesList = responseBody['lectures'] as List;
      if (!lectures.keys.contains(roomName)) {
        isLoading.value = true;
        lectures[roomName] =
            lecturesList.map((e) => LectureModel.fromJson(e)).toList();
      }
    } catch (e) {
      print("error: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getMyCoursesRooms(String api, {bool acceptable}) async {
    try {
      var url = Uri.parse(api);
      var response = await http.get(url);
      var responseBody = jsonDecode(response.body);
      var roomsList = responseBody['rooms_user_accept'] as List;
      if (acceptable) {
        acceptableRooms.value =
            roomsList.map((e) => MyCourseModel.fromJson(e)).toList();
        allRooms.forEach((i) {
          acceptableRooms.forEach((j) {
            if (i.id.toString() == j.roomId) j.roomName = i.name;
          });
        });
      } else {
        unAcceptableRooms.value =
            roomsList.map((e) => MyCourseModel.fromJson(e)).toList();
        allRooms.forEach((i) {
          unAcceptableRooms.forEach((j) {
            if (i.id.toString() == j.roomId) j.roomName = i.name;
          });
        });
      }
    } catch (e) {
      print("error: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteStudentRoom(String roomId) async {
    try {
      var url = Uri.parse(getDeleteRoomAPI(roomId));
      await http.get(url);
      acceptableRooms.removeWhere((e) => e.roomId == roomId);
      unAcceptableRooms.removeWhere((e) => e.roomId == roomId);
      getToast("Item deleted successfully");
    } catch (e) {
      print("error: ${e.toString()}");
    }
  }

  Future<void> registerUserRoom({
    int roomId,
    int stuId,
    String profId,
    CourseModel model,
  }) async {
    bool isRegistered = false;
    unAcceptableRooms.forEach((e) {
      if (e.roomName == model.name) {
        getToast("Course is in pending");
        isRegistered = true;
      }
    });
    acceptableRooms.forEach((e) {
      if (e.roomName == model.name) {
        getToast("Course is already registered");
        isRegistered = true;
      }
    });
    if (isRegistered == false) {
      try {
        var url = Uri.parse(getRegisterUserAPI(roomId, stuId, profId));
        await http.get(url);
        unAcceptableRooms.insert(
            0,
            MyCourseModel(
              roomId: model.id.toString(),
              id: model.id,
              isAcceptable: 0,
              updatedAt: model.updatedAt,
              createdAt: model.createdAt,
              roomName: model.name,
              professorId: model.professorId,
              studentId: userId.value.toString(),
            ));
      } catch (e) {
        print("error: ${e.toString()}");
      }
    }
  }

  @override
  void onInit() async {
    isLoading.value = true;
    tabController = TabController(length: 2, vsync: this);
    userId.value = box.read("userId") ?? 0;
    await getAllRooms();
    await getMyCoursesRooms(getAcceptableRoomAPI(userId.value),
        acceptable: true);
    await getMyCoursesRooms(getNotAcceptableRoomAPI(userId.value),
        acceptable: false);
    getUserData();
    isLoading.value = false;
    super.onInit();
  }
}
