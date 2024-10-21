import 'package:round_app/core/app_export.dart';
import 'package:round_app/presentation/filtter_screen/models/filtter_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the FiltterScreen.
///
/// This class manages the state of the FiltterScreen, including the
/// current filtterModelObj
class FiltterController extends GetxController {
  TextEditingController dateController = TextEditingController();

  TextEditingController dateController1 = TextEditingController();

  Rx<FiltterModel> filtterModelObj = FiltterModel().obs;

  Rx<bool> isSelectedSwitch = false.obs;

  Rx<bool> isSelectedSwitch1 = false.obs;

  Rx<String> scegliIlPeriodoDiTempo = "".obs;

  @override
  void onClose() {
    super.onClose();
    dateController.dispose();
    dateController1.dispose();
  }
}
