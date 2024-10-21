import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';

import 'controller/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  SplashScreen({Key? key}) : super(key: key);
  final controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: appTheme.black900.withOpacity(0.7),
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
              color: appTheme.black900.withOpacity(0.7),
              image: DecorationImage(
                  image: AssetImage(ImageConstant.imgAndroidFour),
                  fit: BoxFit.cover)),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 28.v),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Get.offAllNamed(AppRoutes.loginScreen);
                      },
                      child: Text("lbl_salta".tr,
                          style: CustomTextStyles
                              .titleMediumSecondaryContainerSemiBold),
                    )),
                Spacer(),
                Container(
                    width: 258.h,
                    margin: EdgeInsets.only(left: 30.h, right: 31.h),
                    child: Text("msg_tieni_premuto_per".tr,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineMedium)),
                SizedBox(height: 23.v),
                SizedBox(
                    height: 57.v,
                    child: VerticalDivider(
                        width: 2.h,
                        thickness: 2.v,
                        color: theme.colorScheme.secondaryContainer)),
                SizedBox(height: 24.v),
                CustomImageView(
                    onTap: () {
                      Get.toNamed(AppRoutes.splashTwoScreen);
                    },
                    imagePath: ImageConstant.imgContrast,
                    height: 72.adaptSize,
                    width: 72.adaptSize),
                SizedBox(height: 11.v)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
