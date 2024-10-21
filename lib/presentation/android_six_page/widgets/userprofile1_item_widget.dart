import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';
import 'package:round_app/presentation/video_player/video_player.dart';

import '../controller/android_six_controller.dart';
import '../models/userprofile1_item_model.dart';

// ignore: must_be_immutable
class Userprofile1ItemWidget extends StatelessWidget {
  Userprofile1ItemWidget(
    this.userprofile1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Userprofile1ItemModel userprofile1ItemModelObj;

  var controller = Get.find<AndroidSixController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => VideoPlayerView(
              reward: userprofile1ItemModelObj.reward!.value,
              url: userprofile1ItemModelObj.url!.value,
              id: userprofile1ItemModelObj.id!.value,
            ));
      },
      child: SizedBox(
        width: 168.h,
        child: Align(
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 117.v,
                width: 168.h,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    CustomImageView(
                      imagePath:
                          userprofile1ItemModelObj.userImage!.value.isNotEmpty
                              ? userprofile1ItemModelObj.userImage!.value
                              : ImageConstant.imgRectangle5117x168,
                      height: 117.v,
                      width: 168.h,
                      radius: BorderRadius.circular(
                        8.h,
                      ),
                      alignment: Alignment.center,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 61.h,
                        margin: EdgeInsets.only(
                          left: 8.h,
                          top: 8.v,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.h,
                          vertical: 2.v,
                        ),
                        decoration: AppDecoration.primary.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder11,
                        ),
                        child: Obx(
                          () => Text(
                            userprofile1ItemModelObj.budget!.value,
                            style:
                                CustomTextStyles.labelLargeOnPrimaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.v),
              SizedBox(
                width: 159.h,
                child: Obx(
                  () => Text(
                    userprofile1ItemModelObj.title!.value,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
              ),
              SizedBox(height: 1.v),
              Obx(
                () => Text(
                  userprofile1ItemModelObj.subtitle!.value,
                  style: theme.textTheme.labelLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
