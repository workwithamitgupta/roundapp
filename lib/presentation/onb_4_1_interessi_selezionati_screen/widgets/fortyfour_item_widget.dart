import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';

import '../controller/onb_4_1_interessi_selezionati_controller.dart';

// ignore: must_be_immutable
class FortyfourItemWidget extends StatelessWidget {
  FortyfourItemWidget(
    this.text, {
    Key? key,
  }) : super(
          key: key,
        );

  String text;

  final controller = Get.find<Onb41InteressiSelezionatiController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Theme(
        data: ThemeData(
          canvasColor: Colors.transparent,
        ),
        child: RawChip(
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 8.v,
          ),
          showCheckmark: false,
          labelPadding: EdgeInsets.zero,
          label: Text(
            text,
            style: TextStyle(
              color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
              fontSize: 16.fSize,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
          ),
          selected: controller.selectedTag.contains(text),
          backgroundColor: Colors.transparent,
          selectedColor: theme.colorScheme.onPrimaryContainer,
          shape: controller.selectedTag.contains(text)
              ? RoundedRectangleBorder(
                  side: BorderSide(
                    color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
                    width: 1.h,
                  ),
                  borderRadius: BorderRadius.circular(
                    18.h,
                  ),
                )
              : RoundedRectangleBorder(
                  side: BorderSide(
                    color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
                    width: 1.h,
                  ),
                  borderRadius: BorderRadius.circular(
                    18.h,
                  ),
                ),
          onSelected: (value) {
            if (controller.selectedTag.contains(text)) {
              controller.selectedTag.remove(text);
            } else {
              controller.selectedTag.add(text);
            }
          },
        ),
      ),
    );
  }
}
