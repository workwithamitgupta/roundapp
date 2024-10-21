import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';

// ignore: must_be_immutable
class AppbarLeadingImage extends StatelessWidget {
  AppbarLeadingImage(
      {Key? key, this.imagePath, this.margin, this.onTap, this.fit})
      : super(key: key);

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          imagePath: imagePath,
          height: 48.adaptSize,
          width: 48.adaptSize,
          fit: fit ?? BoxFit.contain,
        ),
      ),
    );
  }
}
