import 'package:round_app/core/app_export.dart';
import 'package:round_app/presentation/splash_screen/models/splash_model.dart';

import '../../android_six_page/android_six_page.dart';

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 1), () {
      if (PrefUtils.getToken().isNotEmpty) {
        Get.offAll(() => AndroidSixPage());
      }
    });
  }
}
