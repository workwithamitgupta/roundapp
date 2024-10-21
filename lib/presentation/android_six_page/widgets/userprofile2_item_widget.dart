import '../controller/android_six_controller.dart';
import '../models/userprofile2_item_model.dart';
import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';

// ignore: must_be_immutable
class Userprofile2ItemWidget extends StatelessWidget {
  Userprofile2ItemWidget(
    this.userprofile2ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Userprofile2ItemModel userprofile2ItemModelObj;

  var controller = Get.find<AndroidSixController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    imagePath: ImageConstant.imgRectangle5117x168,
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
                      margin: EdgeInsets.only(
                        left: 8.h,
                        top: 8.v,
                        right: 99.h,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.h,
                        vertical: 2.v,
                      ),
                      decoration: AppDecoration.primary.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder11,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 2.v),
                          Obx(
                            () => Text(
                              userprofile2ItemModelObj.twentyOneText!.value,
                              style:
                                  CustomTextStyles.labelLargeOnPrimaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.v),
            SizedBox(
              width: 168.h,
              child: Obx(
                () => Text(
                  userprofile2ItemModelObj.trappIlTappetinoText!.value,
                  maxLines: null,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall,
                ),
              ),
            ),
            SizedBox(height: 4.v),
            Obx(
              () => Text(
                userprofile2ItemModelObj.attrezzatureText!.value,
                style: theme.textTheme.labelLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
