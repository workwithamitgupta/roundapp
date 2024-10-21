import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';
import 'package:round_app/core/utils/progress_dialog_utils.dart';
import 'package:round_app/presentation/profile_screen/controller/profile_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/apiClient/api_client.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class WithdrawScreen extends StatelessWidget {
  WithdrawScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prelievi'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Obx(
                  () => Visibility(
                    visible: profileController.accId.value.isNotEmpty,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //SizedBox(height: 50.v),
                        Text(
                            'Importo (Max ${profileController.total.value.toString()} €)'),
                        CustomTextFormField(
                          controller: profileController.amountController,
                          hintText: "Importo".tr,
                          textInputType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty ||
                                int.parse(value) >
                                    profileController.total.value) {
                              return "err_please_enter_valid_importo".tr;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.v),
                        CustomElevatedButton(
                          text: "Prelievi".tr,
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.h, vertical: 20.h),
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            } else {
                              ProgressDialogUtils.showProgressDialog();
                              bool isSuccess = await ApiClient.withDrawAmount(
                                  amount:
                                      profileController.amountController.text);
                              if (isSuccess) {
                                profileController.getTransaction();
                                profileController.amountController.clear();
                                ProgressDialogUtils.hideProgressDialog();
                                Get.back();
                              }
                            }
                          },
                        ),
                      ],
                    ),
                    replacement: CustomElevatedButton(
                      text: "Connect With Stripe".tr,
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 120.h),
                      onPressed: () async {
                        String url = ApiClient.baseUrl +
                            '/connect-stripe?userId=${PrefUtils.getId()}';
                        if (!await launchUrl(Uri.parse(url),
                            mode: LaunchMode.inAppWebView)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
