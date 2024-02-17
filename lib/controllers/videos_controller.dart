import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidflow/model/video.dart';
import 'package:vidflow/screens/dashboard.dart';
import 'package:vidflow/services/videos_api.dart';
import 'package:vidflow/utils/snackbars.dart';

class VideosController extends GetxController {
  final videoLoading = true.obs;
  final RxList<Video> videos = <Video>[].obs;
  final VideosApi videosApi = Get.put(VideosApi());

  final TextEditingController textVideoTitleController = TextEditingController();
  final TextEditingController textVideoThumbNailController = TextEditingController();

  @override
  onInit() {
    super.onInit();
    getAllFromUser();
  }

  Future<void> getAllFromUser() async {
    videoLoading(true);
    try {
      Response<List<Video>> response = await videosApi.getAllFromUser(3);
      if(response.statusCode == 200) {
        videos(response.body);
      }
    } finally {
      videoLoading(false);
    }
  }

  Future<void> createVideo() async {
    Video newVideo = Video(thumbURL: textVideoThumbNailController.text, title: textVideoTitleController.text, userId: 3);
    try {
      Response<void> response = await videosApi.create(newVideo, "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImJldGluaG9iYXJyb3NvQGVtYWlsLmNvbSIsImlhdCI6MTcwODE4NDgwNiwiZXhwIjoxNzA4MTg4NDA2LCJzdWIiOiIzIn0.mx9BOxIYXuL1MYtcRfoiKZuOxDTQTwivO7z59digC7w");
      if(response.statusCode == 201) {
        Get.offAll(() => Dashboard());
        getAllFromUser();
        AppSnacks.getSuccessUpload();
      } else {
        AppSnacks.getErrorUpload();
      }
    } catch (e) {
      print(e);
    }
  }
  
}
