import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vidflow/screens/dashboard.dart';
import 'package:vidflow/utils/api_endpoints.dart';
import 'package:vidflow/utils/snackbars.dart';

class LoginController extends GetxController {
  TextEditingController textEmailController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  Future<void> login() async {
    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};
      Uri url = Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.login);
      Map<String, String> body = {
        'email': textEmailController.text,
        'password': textPasswordController.text,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        Get.to(() => const Dashboard());
      } else {
        AppSnacks.getErrorLogin();
        throw jsonDecode(response.body);
      }

    } catch (e) {
      print(e);
    }
  }
}

