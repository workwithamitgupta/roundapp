import 'package:round_app/core/app_export.dart';
import 'package:round_app/presentation/payment_transfer_screen/models/payment_transfer_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the PaymentTransferScreen.
///
/// This class manages the state of the PaymentTransferScreen, including the
/// current paymentTransferModelObj
class PaymentTransferController extends GetxController {
  TextEditingController amountInputController = TextEditingController();

  TextEditingController accountHolderInputController = TextEditingController();

  TextEditingController ibanInputController = TextEditingController();

  Rx<PaymentTransferModel> paymentTransferModelObj = PaymentTransferModel().obs;

  Rx<bool> saveAsDefaultCheckbox = false.obs;

  @override
  void onClose() {
    super.onClose();
    amountInputController.dispose();
    accountHolderInputController.dispose();
    ibanInputController.dispose();
  }
}
