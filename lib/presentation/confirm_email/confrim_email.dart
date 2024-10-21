import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';

class ConfirmEmailView extends StatelessWidget {
  const ConfirmEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 20.v),
              CustomImageView(
                onTap: () {
                  Get.offAllNamed(AppRoutes.loginScreen);
                },
                imagePath: ImageConstant.imgCloseOnprimarycontainer,
                height: 20.adaptSize,
                width: 20.adaptSize,
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 36.h),
              ),
              Spacer(
                flex: 1,
              ),
              SizedBox(height: 22.v),
              CustomImageView(
                imagePath: ImageConstant.imgVectorOnprimary,
                height: 83.v,
                width: 108.h,
              ),
              SizedBox(height: 22.v),
              Text(
                "lbl_conferma_email".tr,
                style: theme.textTheme.headlineSmall,
              ),
              SizedBox(height: 16.v),
              Container(
                width: 258.h,
                margin: EdgeInsets.symmetric(horizontal: 50.h),
                child: Text(
                  "msg_ti_abbiamo_inviato".tr,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              Spacer(
                flex: 1,
              ),
              SizedBox(height: 40.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'msg_non_hai_ricevuto2',
                    style: CustomTextStyles.titleMediumff0a014f,
                  ),
                  SizedBox(width: 2.v),
                  InkWell(
                    onTap: () {
                      Get.offAllNamed(AppRoutes.loginScreen);
                    },
                    child: Text(
                      "lbl_reinvia".tr,
                      style: CustomTextStyles.titleMediumff4159ce,
                    ),
                  ),
                ],
              ),
              // RichText(
              //   text: TextSpan(
              //     children: [
              //       TextSpan(
              //         text: "msg_non_hai_ricevuto2".tr,
              //         style: CustomTextStyles.titleMediumff0a014f,
              //       ),
              //       TextSpan(
              //         text: " ",
              //       ),
              //       TextSpan(
              //         text: "lbl_reinvia".tr,
              //         style: CustomTextStyles.titleMediumff4159ce,
              //       ),
              //     ],
              //   ),
              //   textAlign: TextAlign.left,
              // ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
