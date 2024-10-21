import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';
import 'package:round_app/presentation/login_screen/models/login_model.dart';

/// A controller class for the LoginScreen.
///
/// This class manages the state of the LoginScreen, including the
/// current loginModelObj
class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<LoginModel> loginModelObj = LoginModel().obs;

  @override
  void onClose() {
    super.onClose();
    emailController.clear();
    passwordController.clear();
    // emailController.dispose();
    // passwordController.dispose();
  }
}
