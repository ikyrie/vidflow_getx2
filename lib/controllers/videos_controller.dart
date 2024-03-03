import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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

  var session = GetStorage().read("session");

  @override
  onInit() {
    super.onInit();
    getAllFromUser();
  }

  Future<void> getAllFromUser() async {
    videoLoading(true);
    try {
      Response<List<Video>> response = await videosApi.getAllFromUser(session['user']['id']);
      if(response.statusCode == 200) {
        videos(response.body);
      }
    } finally {
      videoLoading(false);
    }
  }

  Future<void> createVideo() async {
    Video newVideo = Video(thumbURL: textVideoThumbNailController.text, title: textVideoTitleController.text, userId: session['user']['id']);
    try {
      Response<void> response = await videosApi.create(newVideo, session['accessToken']);
      if(response.statusCode == 201) {
        Get.offAll(() => Dashboard(), transition: Transition.downToUp);
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
