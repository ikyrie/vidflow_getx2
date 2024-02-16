import 'package:get/get.dart';
import 'package:vidflow/model/video.dart';
import 'package:vidflow/utils/api_endpoints.dart';

class VideosApi extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = ApiEndpoints.baseUrl;
  }

  Future<Response<List<Video>>> getAllFromUser(userId) => get(ApiEndpoints.videos, decoder: Video.listFromJson, query: {"userId": userId.toString()});

  Future<Response<Video>> create(Video video, String token) => post(ApiEndpoints.addVideoByUser, video.toMap(), headers: {"Content-Type": "application/json", "Authorization": "Bearer $token"});
}
