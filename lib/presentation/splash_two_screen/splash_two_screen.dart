import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';
import 'package:round_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:round_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:round_app/widgets/app_bar/custom_app_bar.dart';

import 'controller/splash_two_controller.dart';

// ignore_for_file: must_be_immutable
class SplashTwoScreen extends GetWidget<SplashTwoController> {
  const SplashTwoScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(),
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          padding: EdgeInsets.only(top: 56.v),
          decoration: BoxDecoration(
            color: theme.colorScheme.secondaryContainer,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgGroup1,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 3.v),
            child: Container(
              margin: EdgeInsets.only(bottom: 5.v),
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "lbl_yoga_everywhere".tr,
                      style: CustomTextStyles.titleLargeSecondaryContainer,
                    ),
                  ),
                  SizedBox(height: 15.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "msg_un_tappetino_sempre".tr,
                      style: CustomTextStyles.bodyLargeSecondaryContainer,
                    ),
                  ),
                  SizedBox(height: 15.v),
                  _buildFiftyOne(),
                  SizedBox(height: 170.v),
                  Container(
                    width: 287.h,
                    margin: EdgeInsets.only(
                      left: 22.h,
                      right: 24.h,
                    ),
                    child: Text(
                      "msg_video_in_pausa".tr,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium,
                    ),
                  ),
                  //SizedBox(height: 23.v),
                  SizedBox(
                    height: 57.v,
                    child: VerticalDivider(
                      width: 2.h,
                      thickness: 2.v,
                      color: theme.colorScheme.secondaryContainer,
                    ),
                  ),
                  SizedBox(height: 24.v),
                  CustomImageView(
                    onTap: () {
                      Get.offAllNamed(AppRoutes.loginScreen);
                    },
                    imagePath: ImageConstant.imgContrastSecondarycontainer,
                    height: 72.adaptSize,
                    width: 72.adaptSize,
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
      title: AppbarSubtitle(
        text: "lbl_allenamento".tr,
        margin: EdgeInsets.only(left: 20.h),
      ),
      actions: [
        AppbarTrailingImage(
          onTap: () {
            Get.offAllNamed(AppRoutes.loginScreen);
          },
          imagePath: ImageConstant.imgClose,
          margin: EdgeInsets.fromLTRB(36.h, 13.v, 36.h, 22.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildFiftyOne() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgGroup32,
          height: 1.v,
          width: 247.h,
          margin: EdgeInsets.only(
            top: 13.v,
            bottom: 8.v,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.h),
          child: Text(
            "lbl_0_10".tr,
            style: CustomTextStyles.titleMediumSecondaryContainer,
          ),
        ),
      ],
    );
  }
}
