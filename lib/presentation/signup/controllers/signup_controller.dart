import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';

class SignUpController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var isAgreeTermsCondition = false.obs;
  var isAgreePrivacyPolicy = false.obs;
  var isTCFAgree = false.obs;
  var isCookiesAgree = false.obs;
}
