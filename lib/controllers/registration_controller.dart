import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vidflow/utils/api_endpoints.dart';

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
      } else {
        throw jsonDecode(response.body);
      }

    } catch (e) {
      print(e);
    }
  }
}
