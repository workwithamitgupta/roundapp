import '../controller/android_seven_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AndroidSevenScreen.
///
/// This class ensures that the AndroidSevenController is created when the
/// AndroidSevenScreen is first loaded.
class AndroidSevenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AndroidSevenController());
  }
}
