import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';
import 'package:round_app/presentation/view_all_page/models/view_all_model.dart';

import '../../android_six_page/models/userprofile1_item_model.dart';
import '../../video_player/video_player.dart';
import '../controller/view_all_controller.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(this.userprofileItemModelObj, {Key? key})
      : super(key: key);

  Userprofile1ItemModel userprofileItemModelObj;

  var controller = Get.put(ViewAllController(ViewAllModel().obs));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => VideoPlayerView(
              reward: userprofileItemModelObj.reward!.value,
              url: userprofileItemModelObj.url!.value,
              id: userprofileItemModelObj.id!.value,
            ));
      },
      child: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 170.v,
              width: 320.h,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Obx(
                    () => CustomImageView(
                      imagePath:
                          userprofileItemModelObj.userImage!.value.isNotEmpty
                              ? userprofileItemModelObj.userImage!.value
                              : ImageConstant.imgRectangle5,
                      height: 170.v,
                      width: 320.h,
                      radius: BorderRadius.circular(
                        8.h,
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 61.h,
                      margin: EdgeInsets.only(
                        left: 16.h,
                        top: 16.v,
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
                          userprofileItemModelObj.budget!.value,
                          style: CustomTextStyles.labelLargeOnPrimaryContainer,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 9.v),
            Obx(
              () => Text(
                userprofileItemModelObj.title!.value,
                style: theme.textTheme.titleSmall,
              ),
            ),
            SizedBox(height: 6.v),
            Obx(
              () => Text(
                userprofileItemModelObj.subtitle!.value,
                style: theme.textTheme.labelLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
