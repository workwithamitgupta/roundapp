import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';
import 'package:round_app/data/apiClient/api_client.dart';
import 'package:round_app/data/models/user/user_model.dart';
import 'package:round_app/presentation/profile_screen/models/profile_model.dart';

import '../../../data/models/transaction_model/transaction_model.dart';

class ProfileController extends GetxController {
  Rx<ProfileModel> profileModelObj = ProfileModel().obs;

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final newPasswordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final amountController = TextEditingController();

  Rx<bool> isSelectedSwitch = false.obs;

  Rx<bool> isChangePassword = false.obs;
  Rx<bool> isEntrate = true.obs;
  Rx<bool> isUscite = true.obs;
  Rx<DateTime> daDate = DateTime.now().obs;
  Rx<DateTime> aDate = DateTime.now().obs;

  Rx<User> user = User().obs;

  var selectedImage = ''.obs;
  var accId = ''.obs;
  var selectedRadio = 'Seleziona intervallo date'.obs;

  List<Transaction> transaction = <Transaction>[].obs;

  Rx<double> total = 0.0.obs;

  Rx<double> today = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUser();
    getTransaction();
  }

  void fetchUser() {
    ApiClient.fetchUserData().then((value) {
      user.value = value!;
      nameController.text = user.value.data?.name ?? '';
      emailController.text = user.value.data?.email ?? '';
      selectedImage.value = user.value.data?.image?.url ?? '';
      accId.value = user.value.data?.accId ?? '';
    });
  }

  void getTransaction() {
    ApiClient.getTransaction().then((value) {
      transaction.clear();
      transaction.assignAll(value);
      print(transaction.length);
      double amount = 0.0;
      double todayAmount = 0.0;
      for (var x in transaction) {
        if (x.direction.toString().toLowerCase() == 'in') {
          amount += double.parse(x.amount ?? "0");
          DateTime date = DateTime.parse(x.createdAt!).toLocal();
          DateTime today = DateTime.now().toUtc().toLocal();
          if (date.year == today.year &&
              date.month == today.month &&
              date.day == today.day) {
            todayAmount += double.parse(x.amount ?? "0");
          }
        } else {
          amount -= double.parse(x.amount ?? "0");
          DateTime date = DateTime.parse(x.createdAt!).toLocal();
          DateTime today = DateTime.now().toUtc().toLocal();
          if (date.year == today.year &&
              date.month == today.month &&
              date.day == today.day) {
            todayAmount -= double.parse(x.amount ?? "0");
          }
        }
      }
      total.value = double.parse(amount.toStringAsFixed(4));
      today.value = double.parse(todayAmount.toStringAsFixed(4));
    });
  }
}
