import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:vidflow/screens/dashboard.dart';
import 'package:vidflow/utils/api_endpoints.dart';
import 'package:vidflow/utils/snackbars.dart';

class RegistrationController extends GetxController {
  TextEditingController textUserController = TextEditingController();
  TextEditingController textEmailController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();

  Future<void> register() async {
    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};
      Uri url = Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.registration);
      Map<String, String> body = {
        'user': textUserController.text,
        'email': textEmailController.text,
        'password': textPasswordController.text,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 201) {
        final json = jsonDecode(response.body);
        print(json);
        textEmailController.clear();
        textUserController.clear();
        textPasswordController.clear();
        AppSnacks.getConfirmRegistration(true);
      } else {
        AppSnacks.getConfirmRegistration(false);
        throw jsonDecode(response.body);
      }

    } catch (e) {
      print(e);
    }
  }
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
        GetStorage().write('session', json);
        Get.to(() => Dashboard());
      } else {
        Get.defaultDialog(
          title: "Erro no login",
          middleText: "Encontramos um problema durante o processo de login, verifique as informações e tente novamente!",
          cancel: ElevatedButton(onPressed: () => Get.back(), child: Icon(Icons.close)),
        );
        throw jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
