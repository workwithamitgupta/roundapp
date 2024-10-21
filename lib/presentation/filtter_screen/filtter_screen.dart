import 'controller/filtter_controller.dart';
import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';
import 'package:round_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:round_app/widgets/app_bar/custom_app_bar.dart';
import 'package:round_app/widgets/custom_elevated_button.dart';
import 'package:round_app/widgets/custom_radio_button.dart';
import 'package:round_app/widgets/custom_switch.dart';
import 'package:round_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class FiltterScreen extends GetWidget<FiltterController> {
  const FiltterScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(bottom: 5.v),
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "lbl_filtra_per".tr,
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  SizedBox(height: 30.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "msg_visualizza_le_entrate".tr,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(height: 28.v),
                  _buildEightyNine(),
                  SizedBox(height: 33.v),
                  _buildNinety(),
                  SizedBox(height: 47.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "msg_scegli_il_periodo".tr,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(height: 14.v),
                  _buildScegliIlPeriodoDiTempo(),
                  SizedBox(height: 24.v),
                  _buildNinetySix(),
                  SizedBox(height: 50.v),
                  CustomElevatedButton(
                    text: "lbl_applica".tr,
                  ),
                  SizedBox(height: 15.v),
                  Text(
                    "lbl_resetta_filtri".tr,
                    style: CustomTextStyles.titleMediumOnPrimary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgVector,
          margin: EdgeInsets.symmetric(
            horizontal: 36.h,
            vertical: 18.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildEightyNine() {
    return Padding(
      padding: EdgeInsets.only(right: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "lbl_entrate".tr,
            style: theme.textTheme.titleMedium,
          ),
          Obx(
            () => CustomSwitch(
              value: controller.isSelectedSwitch.value,
              onChange: (value) {
                controller.isSelectedSwitch.value = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNinety() {
    return Padding(
      padding: EdgeInsets.only(right: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "lbl_uscite".tr,
            style: theme.textTheme.titleMedium,
          ),
          Obx(
            () => CustomSwitch(
              value: controller.isSelectedSwitch1.value,
              onChange: (value) {
                controller.isSelectedSwitch1.value = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildScegliIlPeriodoDiTempo() {
    return Obx(
      () => Column(
        children: [
          CustomRadioButton(
            width: 320.h,
            text: "msg_ultima_settimana".tr,
            value: controller.filtterModelObj.value.radioList.value[0],
            groupValue: controller.scegliIlPeriodoDiTempo.value,
            padding: EdgeInsets.symmetric(vertical: 1.v),
            isRightCheck: true,
            onChange: (value) {
              controller.scegliIlPeriodoDiTempo.value = value;
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 24.v),
            child: CustomRadioButton(
              width: 320.h,
              text: "lbl_ultima_mese".tr,
              value: controller.filtterModelObj.value.radioList.value[1],
              groupValue: controller.scegliIlPeriodoDiTempo.value,
              padding: EdgeInsets.symmetric(vertical: 1.v),
              isRightCheck: true,
              onChange: (value) {
                controller.scegliIlPeriodoDiTempo.value = value;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24.v),
            child: CustomRadioButton(
              width: 320.h,
              text: "msg_seleziona_intervallo".tr,
              value: controller.filtterModelObj.value.radioList.value[2],
              groupValue: controller.scegliIlPeriodoDiTempo.value,
              padding: EdgeInsets.symmetric(vertical: 1.v),
              isRightCheck: true,
              onChange: (value) {
                controller.scegliIlPeriodoDiTempo.value = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNinetySix() {
    return Padding(
      padding: EdgeInsets.only(right: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 9.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "lbl_da".tr,
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 7.v),
                  CustomTextFormField(
                    width: 149.h,
                    controller: controller.dateController,
                    hintText: "lbl_12_03_2020".tr,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 9.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "lbl_a".tr,
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 7.v),
                  CustomTextFormField(
                    width: 149.h,
                    controller: controller.dateController1,
                    hintText: "lbl_17_03_2020".tr,
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
