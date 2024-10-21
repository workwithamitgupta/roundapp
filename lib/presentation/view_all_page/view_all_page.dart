import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';

import '../android_six_page/controller/android_six_controller.dart';
import '../android_six_page/models/android_six_model.dart';
import '../android_six_page/models/userprofile1_item_model.dart';
import '../view_all_page/widgets/userprofile_item_widget.dart';
import 'controller/view_all_controller.dart';
import 'models/view_all_model.dart';

// ignore_for_file: must_be_immutable
class ViewAllPage extends StatelessWidget {
  ViewAllPage({Key? key}) : super(key: key);

  ViewAllController controller = Get.put(ViewAllController(ViewAllModel().obs));
  AndroidSixController androidSixController =
      Get.put(AndroidSixController(AndroidSixModel().obs));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillSecondaryContainer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.v),
                CustomImageView(
                    imagePath: ImageConstant.imgArrowLeft,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    margin: EdgeInsets.only(left: 20.h),
                    onTap: () {
                      onTapImgArrowLeft();
                    }),
                SizedBox(height: 15.v),
                _buildUserProfile()
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile() {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Obx(() => ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 24.v);
                },
                itemCount: androidSixController.videos?.length ?? 0,
                //  controller
                //     .viewAllModelObj.value.userprofileItemList.value.length,
                itemBuilder: (context, index) {
                  Userprofile1ItemModel model = Userprofile1ItemModel()
                    ..userImage = Rx(
                        androidSixController.videos![index].video!.image?.url ??
                            '')
                    ..id = Rx(androidSixController.videos![index].id ?? 0)
                    ..title =
                        Rx(androidSixController.videos![index].title ?? '')
                    ..budget = Rx('€ ' +
                        androidSixController.videos![index].budget.toString())
                    ..url = Rx(androidSixController.videos![index].video!.url
                        .toString())
                    ..reward =
                        Rx(androidSixController.videos![index].reward ?? 0.0)
                    ..subtitle = Rx(androidSixController
                        .videos![index].description
                        .toString());

                  return UserprofileItemWidget(model);
                }))));
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft() {
    Get.back();
  }
}
