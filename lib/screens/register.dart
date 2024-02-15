import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidflow/components/custom_button.dart';
import 'package:vidflow/components/custom_field.dart';
import 'package:vidflow/controllers/registration_controller.dart';
import 'package:vidflow/utils/colors.dart';
import 'package:vidflow/utils/images.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final RegistrationController registrationController = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueVoid,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Ink(
            decoration: BoxDecoration(
              color: AppColors.primaryBlue,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Image.asset(AppImages.registerImage, height: 160,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Image.asset(AppImages.logo, height: 28,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      "Cadastro",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blueAccent,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 32.0),
                    child: Text("Insira seus dados para criar sua conta."),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: CustomField(
                        label: "Nome", textController: registrationController.textUserController),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: CustomField(
                        label: "Email", textController: registrationController.textEmailController),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: CustomField(
                        label: "Senha", textController: registrationController.textPasswordController),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32.0),
                        child: CustomButton(
                            onTap: registrationController.register, text: "Cadastrar", icon: Icons.login),
                      ),
                      
                    ],
                  ),
                  Column(children: <Widget>[
                    const Text("Já possui uma conta?", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Faça seu login!",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppColors.blueAccent,
                            decorationColor: AppColors.blueAccent,
                          ),
                        ),
                      ),
                  ],)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
