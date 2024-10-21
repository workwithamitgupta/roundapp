import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:round_app/core/app_export.dart';
import 'package:round_app/data/models/user/user_model.dart';
import 'package:round_app/presentation/edit_profile/view/edit_profile.dart';
import 'package:round_app/presentation/payment_list/payment_list.dart';
import 'package:round_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:round_app/widgets/app_bar/appbar_title.dart';
import 'package:round_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:round_app/widgets/app_bar/custom_app_bar.dart';
import 'package:round_app/widgets/custom_bottom_bar.dart';
import 'package:round_app/widgets/custom_switch.dart';

import '../terms_and_conditions/terms_condition_view.dart';
import '../withdraw_screen/withdraw_screen.dart';
import 'controller/profile_controller.dart';

// ignore_for_file: must_be_immutable
class ProfileScreen extends GetWidget<ProfileController> {
  ProfileScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(controller.user.value),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 16.v),
          child: Column(
            children: [
              SizedBox(height: 0.0.v),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSeventy(),
                      // SizedBox(height: 36.v),
                      // _buildRowTwentyNine(),
                      // SizedBox(height: 8.v),
                      // Container(
                      //   width: 276.h,
                      //   margin: EdgeInsets.only(right: 43.h),
                      //   child: Text(
                      //     "msg_avvisami_quando".tr,
                      //     maxLines: 2,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: theme.textTheme.bodyLarge,
                      //   ),
                      // ),
                      // SizedBox(height: 7.v),
                      // Divider(),
                      SizedBox(height: 23.v),
                      _buildRowPreferenzeVideo(
                          preferenzeVideoText: "msg_informazioni_di".tr,
                          onTap: () {
                            Get.to(() => PaymentListPage());
                          }),
                      SizedBox(height: 7.v),
                      Divider(),
                      SizedBox(height: 23.v),
                      _buildRowPreferenzeVideo(
                          preferenzeVideoText: "msg_preferenze_video".tr,
                          onTap: () {
                            Get.toNamed(
                                AppRoutes.onb41InteressiSelezionatiScreen);
                          }),
                      SizedBox(height: 8.v),
                      Divider(),

                      SizedBox(height: 23.v),
                      _buildRowPreferenzeVideo(
                          preferenzeVideoText: "lbl_supporto".tr,
                          onTap: () {
                            Get.to(() => TermsAndConditionsView());
                          }),
                      SizedBox(height: 6.v),
                      Divider(),
                      SizedBox(height: 23.v),
                      _buildRowPreferenzeVideo(
                          preferenzeVideoText: "msg_termini_e_condizioni".tr,
                          onTap: () {
                            Get.to(() => TermsAndConditionsView());
                          }),
                      SizedBox(height: 8.v),
                      Divider(),
                      SizedBox(height: 22.v),
                      InkWell(
                        onTap: () {
                          PrefUtils.clearPreferencesData();
                          Get.offAllNamed(AppRoutes.loginScreen);
                        },
                        child: Text(
                          "lbl_esci".tr,
                          style: CustomTextStyles.titleMediumRed600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(User user) {
    return CustomAppBar(
      leadingWidth: 68.h,
      leading: Obx(
        () => Padding(
          padding: const EdgeInsets.all(15.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AppbarLeadingImage(
              onTap: null,
              imagePath: controller.user.value.data?.image != null
                  ? controller.user.value.data?.image!.url
                  : ImageConstant.personNetworkImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: AppbarTitle(
        text: user.data?.name ?? '',
        margin: EdgeInsets.only(left: 16.h),
      ),
      actions: [
        AppbarTrailingImage(
          onTap: () {
            Get.to(() => EditProfileView());
          },
          imagePath: ImageConstant.imgMdiEdit,
          margin: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 16.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSeventy() {
    return Container(
      width: 320.h,
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 23.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
        image: DecorationImage(
          image: fs.Svg(
            ImageConstant.imgGroup70,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => _buildFrame(
              dynamicText: "lbl_totale".tr,
              dynamicText1: "€" + controller.total.value.toString(),
            ),
          ),
          SizedBox(
            width: 10.v,
          ),
          Obx(
            () => _buildFrame(
              dynamicText: "lbl_oggi".tr,
              dynamicText1: "€" + controller.today.value.toString(),
            ),
          ),
          Spacer(
            flex: 33,
          ),
          Spacer(
            flex: 66,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => WithdrawScreen());
            },
            child: Container(
              width: 50.v,
              height: 50.v,
              decoration: BoxDecoration(
                  color: Colors.greenAccent, shape: BoxShape.circle),
              child: Icon(Icons.arrow_forward),
            ),
          )
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildFrame({
    required String dynamicText,
    required String dynamicText1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dynamicText,
          style: CustomTextStyles.titleSmallSecondaryContainer.copyWith(
            color: theme.colorScheme.secondaryContainer,
          ),
        ),
        SizedBox(height: 6.v),
        Text(
          dynamicText1,
          style: CustomTextStyles.titleMediumSecondaryContainer.copyWith(
            color: theme.colorScheme.secondaryContainer,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildRowTwentyNine() {
    return Padding(
      padding: EdgeInsets.only(right: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "lbl_notifiche".tr,
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
  Widget _buildBottomBar() {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {},
    );
  }

  /// Common widget
  Widget _buildFrameOggi({
    required String dynamicText,
    required String dynamicText1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dynamicText,
          style: CustomTextStyles.titleSmallSecondaryContainer.copyWith(
            color: theme.colorScheme.secondaryContainer,
          ),
        ),
        SizedBox(height: 6.v),
        Text(
          dynamicText1,
          style: CustomTextStyles.titleMediumSecondaryContainer.copyWith(
            color: theme.colorScheme.secondaryContainer,
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildRowPreferenzeVideo(
      {required String preferenzeVideoText, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 1.v),
            child: Text(
              preferenzeVideoText,
              style: theme.textTheme.titleMedium!.copyWith(
                color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRight,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
        ],
      ),
    );
  }
}
