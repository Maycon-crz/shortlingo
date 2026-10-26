import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortlingo/src/routes/route_name.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final obscurePassword = true.obs;

  String? validateEmail(String? value) {
    if (value == null || !GetUtils.isEmail(value.trim())) {
      return 'Informe um e-mail válido';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 4) {
      return 'A senha deve ter ao menos 4 caracteres';
    }
    return null;
  }

  // Sem API por enquanto: qualquer credencial válida entra.
  void login() {
    if (formKey.currentState?.validate() ?? false) {
      Get.offAllNamed(RouteName.home);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
