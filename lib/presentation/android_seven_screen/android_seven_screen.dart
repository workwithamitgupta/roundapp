import 'controller/android_seven_controller.dart';
import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AndroidSevenScreen extends GetWidget<AndroidSevenController> {
  const AndroidSevenScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: SizeUtils.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              _buildSystemBarBase(),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.h,
                    vertical: 60.v,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        ImageConstant.imgGroup1,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4.v),
                      _buildTwenty(),
                      SizedBox(height: 16.v),
                      Text(
                        "lbl_yoga_everywhere".tr,
                        style: CustomTextStyles.titleLargeSecondaryContainer,
                      ),
                      SizedBox(height: 15.v),
                      Text(
                        "msg_un_tappetino_sempre".tr,
                        style: CustomTextStyles.bodyLargeSecondaryContainer,
                      ),
                      SizedBox(height: 15.v),
                      _buildFiftyOne(),
                      SizedBox(height: 92.v),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 287.h,
                          margin: EdgeInsets.only(
                            left: 15.h,
                            right: 16.h,
                          ),
                          child: Text(
                            "msg_video_in_pausa".tr,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.headlineMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: 23.v),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 57.v,
                          child: VerticalDivider(
                            width: 2.h,
                            thickness: 2.v,
                            color: theme.colorScheme.secondaryContainer,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.v),
                      CustomImageView(
                        imagePath: ImageConstant.imgContrastSecondarycontainer,
                        height: 72.adaptSize,
                        width: 72.adaptSize,
                        alignment: Alignment.center,
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
  Widget _buildSystemBarBase() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.all(7.h),
        decoration: AppDecoration.fillGray,
        child: CustomImageView(
          imagePath: ImageConstant.imgIcons,
          height: 10.v,
          width: 46.h,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTwenty() {
    return Padding(
      padding: EdgeInsets.only(right: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.v),
            child: Text(
              "lbl_allenamento".tr,
              style: CustomTextStyles.titleMediumSecondaryContainerSemiBold,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgClose,
            height: 20.adaptSize,
            width: 20.adaptSize,
            margin: EdgeInsets.only(bottom: 8.v),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFiftyOne() {
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgGroup32,
          height: 1.v,
          width: 236.h,
          margin: EdgeInsets.only(
            top: 13.v,
            bottom: 8.v,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 27.h),
          child: Text(
            "lbl_0_10".tr,
            style: CustomTextStyles.titleMediumSecondaryContainer,
          ),
        ),
      ],
    );
  }
}
