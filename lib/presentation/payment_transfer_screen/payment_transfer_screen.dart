import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';
import 'package:round_app/presentation/profile_screen/controller/profile_controller.dart';
import 'package:round_app/widgets/custom_elevated_button.dart';
import 'package:round_app/widgets/custom_text_form_field.dart';

import 'controller/payment_transfer_controller.dart';

class PaymentTransferScreen extends GetWidget<PaymentTransferController> {
  PaymentTransferScreen({Key? key}) : super(key: key);
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 14.v),
        CustomImageView(
            imagePath: ImageConstant.imgArrowLeft,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.only(left: 20.h),
            onTap: () {
              onTapImgArrowLeft();
            }),
        SizedBox(height: 14.v),
        Padding(
            padding: EdgeInsets.only(left: 24.h),
            child: Text("msg_trasferisci_denaro".tr,
                style: theme.textTheme.headlineSmall)),
        SizedBox(height: 17.v),
        Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Text(
                "msg_saldo_disponibile".tr + "${profileController.total.value}",
                style: CustomTextStyles.titleSmallGray600)),
        SizedBox(height: 31.v),
        Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Text("msg_inserisci_importo".tr,
                style: theme.textTheme.bodyLarge)),
        SizedBox(height: 7.v),
        _buildAmountInput(),
        SizedBox(height: 34.v),
        Padding(
            padding: EdgeInsets.only(left: 20.h),
            child:
                Text("lbl_intestatario".tr, style: theme.textTheme.bodyLarge)),
        SizedBox(height: 6.v),
        _buildAccountHolderInput(),
        SizedBox(height: 34.v),
        Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Text("lbl_iban".tr, style: theme.textTheme.bodyLarge)),
        SizedBox(height: 7.v),
        _buildIbanInput(),
        SizedBox(height: 42.v),
        _buildSaveAsDefaultCheckbox(),
        SizedBox(height: 20.v),
        _buildConfirmButton(),
        SizedBox(height: 5.v)
      ]),
    )));
  }

  /// Section Widget
  Widget _buildAmountInput() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: CustomTextFormField(
            controller: controller.amountInputController,
            hintText: '',
            //"lbl_0_142".tr,
            alignment: Alignment.center));
  }

  /// Section Widget
  Widget _buildAccountHolderInput() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: CustomTextFormField(
            controller: controller.accountHolderInputController,
            hintText: '',
            //"lbl_mario_rossi".tr,
            alignment: Alignment.center));
  }

  /// Section Widget
  Widget _buildIbanInput() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: CustomTextFormField(
            controller: controller.ibanInputController,
            hintText: '',
            // "lbl_ilm938nfuwn94".tr,
            textInputAction: TextInputAction.done,
            alignment: Alignment.center));
  }

  /// Section Widget
  Widget _buildSaveAsDefaultCheckbox() {
    return Padding(
        padding: EdgeInsets.only(left: 20.h),
        child: Obx(() => CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  "msg_salva_come_predefinito".tr,
                ),
                value: controller.saveAsDefaultCheckbox.value,
                onChanged: (val) {
                  controller.saveAsDefaultCheckbox.value = val!;
                })
            // CustomCheckboxButton(
            //     text: "msg_salva_come_predefinito".tr,
            //     value: controller.saveAsDefaultCheckbox.value,
            //     padding: EdgeInsets.symmetric(vertical: 1.v),
            //     onChange: (value) {
            //       controller.saveAsDefaultCheckbox.value = value;
            //     })
            ));
  }

  /// Section Widget
  Widget _buildConfirmButton() {
    return CustomElevatedButton(
        onPressed: () {
          Get.back();
        },
        text: "lbl_conferma".tr,
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        alignment: Alignment.center);
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft() {
    Get.back();
  }
}
