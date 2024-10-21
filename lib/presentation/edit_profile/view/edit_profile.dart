import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';
import 'package:round_app/core/utils/progress_dialog_utils.dart';
import 'package:round_app/data/apiClient/api_client.dart';
import 'package:round_app/data/sevices/media_services.dart';
import 'package:round_app/presentation/profile_screen/controller/profile_controller.dart';

import '../../../core/utils/validation_functions.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 22.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 23.h, top: 22.h),
                  child: Text(
                    "Informazioni personali".tr,
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
              ),
              Obx(
                () => Container(
                  margin: EdgeInsets.all(20.v),
                  width: 150.v,
                  height: 150.v,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: CustomImageView(
                    radius: BorderRadius.circular(10),
                    onTap: () async {
                      controller.selectedImage.value =
                          await MediaServices.pickImageFromGallery();
                      if (controller.selectedImage.value.isNotEmpty) {
                        await ApiClient.uploadFile(
                                controller.selectedImage.value)
                            .then((value) => controller.fetchUser());
                      }
                    },
                    imagePath: controller.selectedImage.value.isEmpty
                        ? ImageConstant.personNetworkImage
                        : controller.selectedImage.value,
                    fit: BoxFit.cover,
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
                  readOnly: true,
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
                padding: EdgeInsets.only(right: 10.h),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        controller.isChangePassword.value =
                            !controller.isChangePassword.value;
                      },
                      child: Text(
                        'Modifica password',
                        style: theme.textTheme.titleLarge!
                            .copyWith(color: Colors.blue, fontSize: 15.fSize),
                      ),
                    )),
              ),
              Obx(
                () => Visibility(
                  visible: controller.isChangePassword.value,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.h, vertical: 10.h),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.h, vertical: 10.h),
                        child: CustomTextFormField(
                          controller: controller.newPasswordController,
                          hintText: "New Password".tr,
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.h, vertical: 10.h),
                        child: CustomTextFormField(
                          controller: controller.confirmPasswordController,
                          hintText: "Confirm Password".tr,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null ||
                                (!isValidPassword(value, isRequired: true))) {
                              if (controller.confirmPasswordController.text !=
                                  controller.newPasswordController.text) {
                                return "Password doesn't match".tr;
                              }
                              return "err_msg_please_enter_valid_password".tr;
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomElevatedButton(
                text: "Aggiorna".tr,
                margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
                onPressed: _onTapAggiorna,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapAggiorna() async {
    bool isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      ProgressDialogUtils.showProgressDialog();
      if (controller.passwordController.text.isEmpty) {
        Map<String, dynamic> data = {
          'name': controller.nameController.text.trim(),
          'id': PrefUtils.getId(),
        };
        await ApiClient.updateUser(data);
      } else {
        Map<String, dynamic> data = {
          'name': controller.nameController.text.trim(),
          'id': PrefUtils.getId(),
          'password': controller.passwordController.text.trim(),
          'password_new': controller.passwordController.text.trim(),
          'password_new_confirm':
              controller.confirmPasswordController.text.trim(),
        };
        await ApiClient.updateUser(data);
      }
      ProgressDialogUtils.hideProgressDialog();
    }
  }
}
