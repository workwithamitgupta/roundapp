import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:round_app/core/app_export.dart';
import 'package:round_app/core/utils/progress_dialog_utils.dart';
import 'package:round_app/data/apiClient/api_client.dart';
import 'package:round_app/presentation/confirm_email/confrim_email.dart';
import 'package:round_app/presentation/signup/controllers/signup_controller.dart';
import 'package:round_app/presentation/terms_and_conditions/terms_condition_view.dart';
import 'package:webview_flutter/webview_flutter.dart' as wf;

import '../../../core/utils/validation_functions.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class SignUpView extends StatelessWidget {
  SignUpView({Key? key}) : super(key: key);
  final controller = Get.put(SignUpController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 22.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 23.h, top: 12.h),
                  child: Text(
                    "Registrati".tr,
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
                child: CustomTextFormField(
                  controller: controller.nameController,
                  hintText: "Name".tr,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "err_please_enter_valid_name".tr;
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
                child: CustomTextFormField(
                  controller: controller.passwordController,
                  hintText: "lbl_password".tr,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        (!isValidPassword(value, isRequired: true))) {
                      return "err_msg_please_enter_valid_password".tr;
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
                child: CustomTextFormField(
                  controller: controller.confirmPasswordController,
                  hintText: "Confirm Password".tr,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        (!isValidPassword(value, isRequired: true))) {
                      if (controller.confirmPasswordController.text !=
                          controller.passwordController.text) {
                        return "Password doesn't match".tr;
                      }
                      return "err_msg_please_enter_valid_password".tr;
                    }
                    return null;
                  },
                ),
              ),
              Obx(
                () => CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Ho letto accetto '),
                  value: controller.isAgreePrivacyPolicy.value,
                  onChanged: (val) {
                    controller.isAgreePrivacyPolicy.value = val!;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.h),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Get.defaultDialog(
                          title: '',
                          content: PrivacyPolicyScreen(),
                          backgroundColor: Colors.white,
                          titlePadding: EdgeInsets.zero,
                          contentPadding: EdgeInsets.zero,
                        );
                        //Get.to(() => TermsAndConditionsView());
                      },
                      child: Text(
                        'Privacy Policy',
                        style: theme.textTheme.titleLarge!
                            .copyWith(color: Colors.blue, fontSize: 15.fSize),
                      ),
                    )),
              ),
              Obx(
                () => CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Ho letto accetto '),
                  value: controller.isCookiesAgree.value,
                  onChanged: (val) {
                    controller.isCookiesAgree.value = val!;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.h),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Get.defaultDialog(
                          title: '',
                          content: SizedBox(
                            height: SizeUtils.height * 0.5,
                            child: wf.WebView(
                              initialUrl:
                                  'https://www.iubenda.com/privacy-policy/53657342/cookie-policy',
                              javascriptMode: wf.JavascriptMode.unrestricted,
                            ),
                          ),
                          backgroundColor: Colors.white,
                          titlePadding: EdgeInsets.zero,
                          contentPadding: EdgeInsets.zero,
                        );
                      },
                      child: Text(
                        'Cookies',
                        style: theme.textTheme.titleLarge!
                            .copyWith(color: Colors.blue, fontSize: 15.fSize),
                      ),
                    )),
              ),
              Obx(
                () => CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Ho letto accetto'),
                  value: controller.isAgreeTermsCondition.value,
                  onChanged: (val) {
                    controller.isAgreeTermsCondition.value = val!;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.h),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Get.defaultDialog(
                          title: '',
                          content: TermsAndConditionsView(),
                          backgroundColor: Colors.white,
                          titlePadding: EdgeInsets.zero,
                          contentPadding: EdgeInsets.zero,
                        );
                      },
                      child: Text(
                        'Termini e Condizioni',
                        style: theme.textTheme.titleLarge!
                            .copyWith(color: Colors.blue, fontSize: 15.fSize),
                      ),
                    )),
              ),
              Obx(
                () => CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Ho letto accetto '),
                  value: controller.isTCFAgree.value,
                  onChanged: (val) {
                    controller.isTCFAgree.value = val!;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.h),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Get.defaultDialog(
                          title: '',
                          content: SizedBox(
                            height: SizeUtils.height * 0.5,
                            child: wf.WebView(
                              initialUrl: 'https://admin.roundapp.it/auth/tcf',
                              javascriptMode: wf.JavascriptMode.unrestricted,
                            ),
                          ),
                          backgroundColor: Colors.white,
                          titlePadding: EdgeInsets.zero,
                          contentPadding: EdgeInsets.zero,
                        );
                      },
                      child: Text(
                        'TCF Information',
                        style: theme.textTheme.titleLarge!
                            .copyWith(color: Colors.blue, fontSize: 15.fSize),
                      ),
                    )),
              ),
              CustomElevatedButton(
                text: "Registrati".tr,
                margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
                onPressed: _onTapAccedi,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hai gia un account ?',
                    style: theme.textTheme.titleLarge,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.loginScreen);
                    },
                    child: Text(
                      'Accedi',
                      style: theme.textTheme.titleLarge!
                          .copyWith(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapAccedi() async {
    bool isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      if (controller.isAgreePrivacyPolicy.value &&
          controller.isAgreeTermsCondition.value &&
          controller.isCookiesAgree.value &&
          controller.isTCFAgree.value) {
        ProgressDialogUtils.showProgressDialog();
        bool isLogin = await ApiClient.register(
            name: controller.nameController.text,
            email: controller.emailController.text.trim(),
            password: controller.passwordController.text.trim(),
            confirmPassword: controller.confirmPasswordController.text.trim());
        ProgressDialogUtils.hideProgressDialog();
        if (isLogin) {
          Get.to(() => ConfirmEmailView());
        } else {
          Fluttertoast.showToast(msg: 'The given data was invalid.');
        }
      } else {
        Fluttertoast.showToast(
            msg:
                'You have to agree terms and conditions, privacy policy and cookies');
      }
    }
  }
}
