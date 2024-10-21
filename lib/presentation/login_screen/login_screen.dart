import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:round_app/core/app_export.dart';
import 'package:round_app/core/utils/progress_dialog_utils.dart';
import 'package:round_app/core/utils/validation_functions.dart';
import 'package:round_app/data/apiClient/api_client.dart';
import 'package:round_app/data/sevices/firebase_services/firebase_service.dart';
import 'package:round_app/presentation/forgot_password/forgot_password.dart';
import 'package:round_app/presentation/signup/views/signup_view.dart';
import 'package:round_app/widgets/custom_elevated_button.dart';
import 'package:round_app/widgets/custom_text_form_field.dart';
import 'package:webview_flutter/webview_flutter.dart' as wf;

import '../android_six_page/android_six_page.dart';
import 'controller/login_controller.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    SizedBox(height: 22.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 23.h),
                        child: Text(
                          "lbl_accedi".tr,
                          style: theme.textTheme.headlineSmall,
                        ),
                      ),
                    ),
                    SizedBox(height: 56.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: CustomTextFormField(
                        controller: controller.emailController,
                        hintText: "lbl_email".tr,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              (!isValidEmail(value, isRequired: true))) {
                            return "err_msg_please_enter_valid_email".tr;
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 46.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: CustomTextFormField(
                        controller: controller.passwordController,
                        hintText: "lbl_password".tr,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value == null ||
                              (!isValidPassword(value, isRequired: true))) {
                            return "err_msg_please_enter_valid_password".tr;
                          }
                          return null;
                        },
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 10.v),
                    Padding(
                      padding: EdgeInsets.only(right: 10.v),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                              onTap: () {
                                Get.to(() => ForgotPasswordView());
                              },
                              child: Text('Password dimenticata?'))),
                    ),
                    SizedBox(height: 24.v),
                    CustomElevatedButton(
                      text: "lbl_accedi".tr,
                      margin: EdgeInsets.symmetric(horizontal: 20.h),
                      onPressed: _onTapAccedi,
                    ),
                    SizedBox(height: 17.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "msg_non_hai_ancora_un2".tr,
                          style: CustomTextStyles.titleMediumff0a014f,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => SignUpView());
                          },
                          child: Text(
                            "lbl_registrati".tr,
                            style: CustomTextStyles.titleMediumff4159ce,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 90.v),
                    Text(
                      "msg_oppure_accedi_con".tr,
                      style: theme.textTheme.bodyLarge,
                    ),
                    SizedBox(height: 26.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 94.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // CustomImageView(
                          //   onTap: _onTapFacebookIcon,
                          //   imagePath: ImageConstant.imgFacebook,
                          //   height: 26.adaptSize,
                          //   width: 26.adaptSize,
                          //   margin: EdgeInsets.only(top: 3.v),
                          // ),
                          // SizedBox(width: 50.v),
                          CustomImageView(
                            onTap: _onTapGoogleIcon,
                            imagePath: ImageConstant.imgIconsSocialGoogle,
                            height: 26.adaptSize,
                            width: 26.adaptSize,
                            margin: EdgeInsets.only(top: 3.v),
                          ),

                          // CustomImageView(
                          //   imagePath: ImageConstant
                          //       .imgIconsSocialGoogleOnprimarycontainer,
                          //   height: 30.adaptSize,
                          //   width: 30.adaptSize,
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapGoogleIcon() async {
    User? user = await FirebaseServices.signInWithGoogle();

    if (user != null) {
      print("User signed in: ${user.displayName}");
      print("User signed in: ${user.email}");
      print("User signed in: ${user.photoURL}");
      ApiClient.loginWithSocial(
              email: user.email ?? '', name: user.displayName ?? '')
          .then((isSuccess) {
        if (isSuccess) {
          Get.toNamed(AppRoutes.onb41InteressiSelezionatiScreen);
          // Get.offAll(() => AndroidSixPage());
        } else {
          Fluttertoast.showToast(msg: 'Something went wrong');
        }
      });
    } else {
      print("Google Sign-In failed");
    }
  }

  void _onTapFacebookIcon() async {
    print('_onTapFacebookIcon');
    User? user = await FirebaseServices.signInWithFacebook();

    if (user != null) {
      print("User signed in: ${user.displayName}");
      print("User signed in: ${user.email}");
      print("User signed in: ${user.photoURL}");
    } else {
      print("Facebook Sign-In failed");
    }
  }

  void _onTapAccedi() async {
    bool isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      ProgressDialogUtils.showProgressDialog();
      bool isLogin = await ApiClient.login(
        email: controller.emailController.text.trim(),
        password: controller.passwordController.text.trim(),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (isLogin) {
        print(PrefUtils.getTag());
        if (PrefUtils.getTag().isNotEmpty) {
          Get.offAll(() => AndroidSixPage());
        } else {
          Get.toNamed(AppRoutes.onb41InteressiSelezionatiScreen);
        }
      } else {
        Fluttertoast.showToast(msg: 'nome utente/password non sono corretti.');
      }
    }
  }
}

class MyWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TCF Information'),
      ),
      body: wf.WebView(
        initialUrl: 'https://roundapp.it/backend/tcf',
        javascriptMode: wf.JavascriptMode.unrestricted,
      ),
    );
  }
}
