import 'package:round_app/core/app_export.dart';
import 'package:round_app/presentation/android_seven_screen/models/android_seven_model.dart';

/// A controller class for the AndroidSevenScreen.
///
/// This class manages the state of the AndroidSevenScreen, including the
/// current androidSevenModelObj
class AndroidSevenController extends GetxController {
  Rx<AndroidSevenModel> androidSevenModelObj = AndroidSevenModel().obs;
}
