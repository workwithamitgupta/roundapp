import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:round_app/core/app_export.dart';
import 'package:round_app/core/utils/progress_dialog_utils.dart';
import 'package:round_app/data/apiClient/api_client.dart';
import 'package:round_app/presentation/android_six_page/android_six_page.dart';
import 'package:round_app/widgets/app_bar/appbar_title.dart';
import 'package:round_app/widgets/app_bar/custom_app_bar.dart';
import 'package:round_app/widgets/custom_elevated_button.dart';

import '../onb_4_1_interessi_selezionati_screen/widgets/fortyfour_item_widget.dart';
import 'controller/onb_4_1_interessi_selezionati_controller.dart';

// ignore_for_file: must_be_immutable
class Onb41InteressiSelezionatiScreen
    extends GetWidget<Onb41InteressiSelezionatiController> {
  const Onb41InteressiSelezionatiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray50,
        appBar: _buildAppBar(),
        body: Container(
          width: 375.h,
          padding: EdgeInsets.symmetric(vertical: 14.v),
          child: Column(
            children: [
              SizedBox(height: 31.v),
              Expanded(
                child: SingleChildScrollView(
                  child: _buildInterests(),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildContinueButton(),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 59.v,
      title: AppbarTitle(
        text: "msg_quali_sono_i_tuoi".tr,
        margin: EdgeInsets.only(left: 20.h),
      ),
      actions: [],
    );
  }

  /// Section Widget
  Widget _buildInterests() {
    return Container(
      margin: EdgeInsets.only(bottom: 5.v),
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Wrap(
              spacing: 10.v,
              runSpacing: 10.v,
              children: List.generate(
                  controller.selectedTag.length,
                  (index) => Container(
                        padding: EdgeInsets.all(10.v),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0XFF57DFB5),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              controller.selectedTag[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.fSize),
                            ),
                            SizedBox(
                              width: 5.v,
                            ),
                            GestureDetector(
                                onTap: () {
                                  controller.selectedTag.removeAt(index);
                                },
                                child: Icon(Icons.close))
                          ],
                        ),
                      )),
            ),
          ),
          SizedBox(height: 20.v),
          Obx(
            () => controller.tags.length == 0
                ? CircularProgressIndicator()
                : Wrap(
                    runSpacing: 8.v,
                    spacing: 8.h,
                    children: List<Widget>.generate(
                      controller.tags.length,
                      (index) {
                        return FortyfourItemWidget(
                          controller.tags[index].code,
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildContinueButton() {
    return CustomElevatedButton(
      text: "lbl_continua".tr,
      margin: EdgeInsets.only(
        left: 20.h,
        right: 20.h,
        bottom: 50.v,
      ),
      onPressed: () async {
        ProgressDialogUtils.showProgressDialog();
        Map<String, dynamic> data = {'tags': controller.selectedTag};
        await ApiClient.updateUser(data);
        PrefUtils.setTag(controller.selectedTag);
        controller.selectedTag.clear();
        Fluttertoast.showToast(msg: 'Success');
        ProgressDialogUtils.hideProgressDialog();
        Get.offAll(() => AndroidSixPage());
      },
    );
  }
}
