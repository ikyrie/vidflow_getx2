import 'package:get/get.dart';

class AppSnacks {
  static getConfirmRegistration(bool success) {
    if(success) {
      return Get.showSnackbar(const GetSnackBar(title: "Cadastro realizado!", message: "Você já pode fazer o seu login", duration: Duration(seconds: 2),));
    } else {
      return Get.showSnackbar(const GetSnackBar(title: "Erro no seu cadastro!", message: "Tente novamente mais tarde", duration: Duration(seconds: 2),));
    }
  }
  static getErrorLogin() {
      return Get.showSnackbar(const GetSnackBar(title: "Erro ao realizar o login", message: "Confira seu email e senha e tente novamente", duration: Duration(seconds: 2),));
  }
}
