import 'package:flutter/material.dart';
import 'package:vidflow/components/custom_button.dart';
import 'package:vidflow/components/custom_field.dart';
import 'package:vidflow/utils/colors.dart';
import 'package:vidflow/utils/images.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController textEmailController = TextEditingController();
  final TextEditingController textPasswordController = TextEditingController();

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
                    child: Image.asset(AppImages.loginImage, height: 160,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Image.asset(AppImages.logo, height: 28,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blueAccent,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 32.0),
                    child: Text("Insira seus dados para acessar sua conta."),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: CustomField(
                        label: "Email", textController: textEmailController),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: CustomField(
                        label: "Senha", textController: textPasswordController),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ CustomButton(onTap: (){}, text: "Entrar", icon: Icons.login),],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
