import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:round_app/core/app_export.dart';
import 'package:round_app/core/utils/progress_dialog_utils.dart';
import 'package:round_app/data/apiClient/api_client.dart';
import 'package:round_app/widgets/custom_elevated_button.dart';
import 'package:round_app/widgets/custom_text_form_field.dart';

import '../../core/utils/validation_functions.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.v),
                  child: Text(
                    'Reset Password',
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: 36.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: CustomTextFormField(
                    controller: emailController,
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
                SizedBox(height: 36.v),
                CustomElevatedButton(
                  text: "Anvia".tr,
                  margin: EdgeInsets.symmetric(horizontal: 20.h),
                  onPressed: _onTapAnvia,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapAnvia() async {
    bool isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      ProgressDialogUtils.showProgressDialog();
      bool isSuccess =
          await ApiClient.forgotPassword(emailController.text.trim());
      ProgressDialogUtils.hideProgressDialog();
      if (isSuccess) {
        Fluttertoast.showToast(
            msg: "We have emailed your password reset link!");
        Get.offAllNamed(AppRoutes.loginScreen);
      } else {
        Fluttertoast.showToast(msg: "Something went wrong");
      }
    }
  }
}
