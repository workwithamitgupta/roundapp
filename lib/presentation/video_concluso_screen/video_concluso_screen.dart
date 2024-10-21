import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';
import 'package:round_app/presentation/android_six_page/android_six_page.dart';

import '../../data/apiClient/api_client.dart';
import 'controller/video_concluso_controller.dart';

// ignore_for_file: must_be_immutable
class VideoConclusoScreen extends GetWidget<VideoConclusoController> {
  const VideoConclusoScreen({Key? key, required this.reward, required this.id})
      : super(key: key);
  final double reward;
  final int id;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 375.h,
          child: SingleChildScrollView(
            child: SizedBox(
              height: 768.v,
              width: 375.h,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 36.h,
                        vertical: 17.v,
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            ImageConstant.imgGroup3,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomImageView(
                            onTap: () {
                              Get.offAll(() => AndroidSixPage());
                            },
                            imagePath: ImageConstant.imgCloseOnprimarycontainer,
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                            alignment: Alignment.centerRight,
                          ),
                          SizedBox(height: 29.v),
                          Container(
                            width: 227.h,
                            margin: EdgeInsets.symmetric(horizontal: 37.h),
                            child: Text(
                              "msg_fantastico_hai".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                          SizedBox(height: 13.v),
                          Text(
                            reward.toString(),
                            //  "lbl_0_021".tr,
                            style: theme.textTheme.headlineSmall,
                          ),
                          SizedBox(height: 94.v),
                          Text(
                            "lbl_grazie_a".tr,
                            style: theme.textTheme.bodyLarge,
                          ),
                          SizedBox(height: 15.v),
                          CustomImageView(
                            imagePath: ImageConstant.imgFitbitLogo161,
                            height: 40.v,
                            width: 158.h,
                          ),
                          SizedBox(height: 14.v),
                          Text(
                            "lbl_fitbit".tr,
                            style: CustomTextStyles.titleLargeSemiBold,
                          ),
                          SizedBox(height: 16.v),
                          Container(
                            width: 274.h,
                            margin: EdgeInsets.only(
                              left: 13.h,
                              right: 14.h,
                            ),
                            child: Text(
                              "msg_trova_la_tua_forma".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                          SizedBox(height: 12.v),
                          Text(
                            "msg_visita_il_sito_web".tr,
                            style: CustomTextStyles.titleMediumOnPrimary,
                          ),
                          SizedBox(height: 159.v),
                          CustomImageView(
                            onTap: () async {
                              await ApiClient.addTransaction(
                                      id: id, reward: reward)
                                  .then((value) {
                                if (value) {
                                  Get.offAll(() => AndroidSixPage());
                                }
                              });
                            },
                            imagePath: ImageConstant.imgSettings,
                            height: 37.v,
                            width: 25.h,
                          ),
                          SizedBox(height: 8.v),
                          Text(
                            "lbl_prossimo_video".tr,
                            style: theme.textTheme.bodyLarge,
                          ),
                          SizedBox(height: 60.v),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 157.h,
                        vertical: 16.v,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusStyle.roundedBorder32,
                        image: DecorationImage(
                          image: AssetImage(
                            ImageConstant.imgRectangle6,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Divider(
                        color:
                            theme.colorScheme.onPrimaryContainer.withOpacity(1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
