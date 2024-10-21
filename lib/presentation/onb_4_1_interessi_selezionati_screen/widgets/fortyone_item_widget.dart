import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';

import '../controller/onb_4_1_interessi_selezionati_controller.dart';

// ignore: must_be_immutable
class FortyoneItemWidget extends StatelessWidget {
  FortyoneItemWidget(this.text, {Key? key}) : super(key: key);

  String text;
  final controller = Get.find<Onb41InteressiSelezionatiController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: EdgeInsets.only(
          left: 16.h,
          top: 10.v,
          bottom: 10.v,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          text,
          //fortyoneItemModelObj.chipsSelected!.value,
          style: TextStyle(
            color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
            fontSize: 16.fSize,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
        deleteIcon: CustomImageView(
          imagePath: ImageConstant.imgMdiclose,
          height: 24.adaptSize,
          width: 24.adaptSize,
          margin: EdgeInsets.only(left: 8.h),
        ),
        onDeleted: () {},
        selected: controller.selectedTag.contains(text),
        //(fortyoneItemModelObj.isSelected?.value ?? false),
        backgroundColor: theme.colorScheme.primary,
        selectedColor: theme.colorScheme.primary,
        shape: controller.selectedTag.contains(text)
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: theme.colorScheme.onPrimaryContainer.withOpacity(0.6),
                  width: 1.h,
                ),
                borderRadius: BorderRadius.circular(
                  20.h,
                ),
              )
            : RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  20.h,
                ),
              ),
        onSelected: (value) {
          if (controller.selectedTag.contains(text)) {
            controller.selectedTag.remove(text);
          } else {
            controller.selectedTag.add(text);
          }
          //fortyoneItemModelObj.isSelected!.value = value;
        },
      ),
    );
  }
}
