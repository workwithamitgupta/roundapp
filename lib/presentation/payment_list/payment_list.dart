import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';
import 'package:round_app/presentation/profile_screen/controller/profile_controller.dart';
import 'package:round_app/presentation/withdraw_screen/withdraw_screen.dart';
import 'package:round_app/widgets/custom_radio_button.dart';
import 'package:round_app/widgets/custom_switch.dart';

import '../../data/models/transaction_model/transaction_model.dart';
import '../../widgets/custom_elevated_button.dart';

class PaymentListPage extends StatelessWidget {
  PaymentListPage({Key? key}) : super(key: key);
  final controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.getTransaction();
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('msg_informazioni_di'.tr),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'II Tuo saldo',
                    style: CustomTextStyles.titleMediumSemiBold,
                  ),
                  SizedBox(height: 24.v),
                  Text('Totale'),
                  SizedBox(height: 24.v),
                  Text(
                    "€" + controller.total.value.toString(),
                    style: CustomTextStyles.titleMediumSemiBold,
                  ),
                  SizedBox(height: 24.v),
                  Center(
                    child: CustomElevatedButton(
                      text: "trasferisci denaro".tr,
                      margin: EdgeInsets.symmetric(horizontal: 20.h),
                      onPressed: () {
                        Get.to(() => WithdrawScreen());
                      },
                    ),
                  ),
                  SizedBox(height: 54.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Attivita'),
                      InkWell(
                        onTap: () {
                          controller.getTransaction();
                          Get.to(() => FiltraPerScreen());
                        },
                        child: Text(
                          'Filtra Per',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.v),
                  Obx(
                    () => ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.transaction.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(height: 14.v),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      DateTime.parse(controller
                                                  .transaction[index]
                                                  .createdAt ??
                                              "")
                                          .toLocal()
                                          .toString()
                                          .substring(0, 10),
                                      style: TextStyle(
                                          fontSize: 12.fSize,
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      controller.transaction[index].type ?? "",
                                      style:
                                          CustomTextStyles.titleMediumSemiBold,
                                    ),
                                  ],
                                ),
                                Text(
                                  "€ ${controller.transaction[index].amount}",
                                  style: TextStyle(
                                      color: controller.transaction[index]
                                                  .direction ==
                                              'in'
                                          ? Color(0xFF57DFB5)
                                          : Colors.red,
                                      fontSize: 16.fSize),
                                ),
                              ],
                            ),
                            SizedBox(height: 14.v),
                            Divider()
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )
          // SingleChildScrollView(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          //     child: Column(
          //       children: [
          //         Table(
          //           border: TableBorder.all(),
          //           children: [
          //             TableRow(
          //               children: [
          //                 TableCell(
          //                   child: Center(
          //                     child: Text(
          //                       'Date',
          //                       style: TextStyle(fontWeight: FontWeight.bold),
          //                     ),
          //                   ),
          //                 ),
          //                 TableCell(
          //                   child: Center(
          //                     child: Text(
          //                       'Amount',
          //                       style: TextStyle(fontWeight: FontWeight.bold),
          //                     ),
          //                   ),
          //                 ),
          //                 TableCell(
          //                   child: Center(
          //                     child: Text('Direction',
          //                         style: TextStyle(fontWeight: FontWeight.bold)),
          //                   ),
          //                 ),
          //                 TableCell(
          //                   child: Center(
          //                     child: Text(
          //                       'Type',
          //                       style: TextStyle(
          //                         fontWeight: FontWeight.bold,
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             ...List.generate(
          //               controller.transaction.length,
          //               (index) => TableRow(
          //                 children: [
          //                   TableCell(
          //                     child: Center(
          //                       child: Text(
          //                         DateTime.parse(
          //                                 controller.transaction[index].createdAt ??
          //                                     "")
          //                             .toLocal()
          //                             .toString()
          //                             .substring(0, 10),
          //                       ),
          //                     ),
          //                   ),
          //                   TableCell(
          //                     child: Center(
          //                       child: Text(
          //                           "€ ${controller.transaction[index].amount}"),
          //                     ),
          //                   ),
          //                   TableCell(
          //                     child: Center(
          //                       child: Text(
          //                           controller.transaction[index].direction ?? ""),
          //                     ),
          //                   ),
          //                   TableCell(
          //                     child: Center(
          //                       child:
          //                           Text(controller.transaction[index].type ?? ""),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             )
          //           ],
          //         )
          //       ],
          //     ),
          //   ),
          // ),

          ),
    );
  }
}

class FiltraPerScreen extends StatelessWidget {
  FiltraPerScreen({Key? key}) : super(key: key);
  final controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close)),
              ),
              Text(
                'Filtra per',
                style: CustomTextStyles.titleMediumSemiBold,
              ),
              SizedBox(height: 12.v),
              Text('Visualizza le entrate e uscite'),
              SizedBox(height: 12.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Entrate',
                    style: CustomTextStyles.titleMediumSemiBold16,
                  ),
                  Obx(
                    () => CustomSwitch(
                        value: controller.isEntrate.value,
                        onChange: (val) {
                          controller.isEntrate.value = val;
                        }),
                  )
                ],
              ),
              SizedBox(height: 5.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Uscite',
                    style: CustomTextStyles.titleMediumSemiBold16,
                  ),
                  Obx(() => CustomSwitch(
                      value: controller.isUscite.value,
                      onChange: (val) {
                        controller.isUscite.value = val;
                      }))
                ],
              ),
              SizedBox(height: 10.v),
              Text('Scegli il periodo di tempo'),
              SizedBox(height: 10.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ultima settimana',
                    style: CustomTextStyles.titleMediumSemiBold16,
                  ),
                  Obx(
                    () => CustomRadioButton(
                        groupValue: controller.selectedRadio.value,
                        value: 'Ultima settimana',
                        onChange: (val) {
                          controller.selectedRadio.value = val;
                          controller.selectedRadio.value = val;
                          controller.aDate.value = DateTime.now();
                          controller.daDate.value =
                              DateTime.now().subtract(Duration(days: 7));
                        }),
                  )
                ],
              ),
              SizedBox(height: 5.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ultima mese',
                    style: CustomTextStyles.titleMediumSemiBold16,
                  ),
                  Obx(
                    () => CustomRadioButton(
                        groupValue: controller.selectedRadio.value,
                        value: 'Ultima mese',
                        onChange: (val) {
                          controller.selectedRadio.value = val;
                          controller.aDate.value = DateTime.now();
                          controller.daDate.value =
                              DateTime.now().subtract(Duration(days: 30));
                        }),
                  )
                ],
              ),
              SizedBox(height: 5.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Seleziona intervallo date',
                    style: CustomTextStyles.titleMediumSemiBold16,
                  ),
                  Obx(
                    () => CustomRadioButton(
                      groupValue: controller.selectedRadio.value,
                      value: 'Seleziona intervallo date',
                      onChange: (val) {
                        controller.selectedRadio.value = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 15.v),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('DA'),
                      Obx(
                        () => TextFormField(
                          readOnly: true,
                          onTap: () async {
                            if (controller.selectedRadio.value ==
                                'Seleziona intervallo date') {
                              DateTime? selectedDate = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1999),
                                lastDate: DateTime(2035),
                                initialDate: controller.daDate.value,
                              );
                              if (selectedDate != null) {
                                controller.daDate.value = selectedDate;
                                print(controller.daDate.value);
                              }
                            }
                          },
                          decoration: InputDecoration(
                              hintText: controller.daDate.value.format()),
                        ),
                      ),
                    ],
                  )),
                  SizedBox(width: 5.h),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('A'),
                      Obx(
                        () => TextFormField(
                          readOnly: true,
                          onTap: () async {
                            if (controller.selectedRadio.value ==
                                'Seleziona intervallo date') {
                              DateTime? selectedDate = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1999),
                                lastDate: DateTime(2035),
                                initialDate: controller.aDate.value,
                              );
                              if (selectedDate != null) {
                                controller.aDate.value = selectedDate;
                                print(controller.aDate.value);
                              }
                            }
                          },
                          decoration: InputDecoration(
                              hintText: controller.aDate.value.format()),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
              SizedBox(height: 55.v),
              Center(
                child: CustomElevatedButton(
                  text: "Applica".tr,
                  margin: EdgeInsets.symmetric(horizontal: 20.h),
                  onPressed: () {
                    List<Transaction> filterTransactions =
                        controller.transaction.where((element) {
                      if (!controller.isEntrate.value &&
                          element.direction!.toLowerCase() == 'in') {
                        return false;
                      }
                      if (!controller.isUscite.value &&
                          element.direction!.toLowerCase() == 'out') {
                        return false;
                      }

                      DateTime date = DateTime.parse(element.createdAt ?? "");
                      date = DateTime(date.year, date.month, date.day, 0, 0, 0);
                      DateTime startDateObj = controller.daDate.value;
                      DateTime endDateObj = controller.aDate.value;
                      return (date.isAfter(startDateObj) ||
                              date.isAtSameMomentAs(startDateObj)) &&
                          (date.isBefore(endDateObj) ||
                              date.isAtSameMomentAs(endDateObj));
                    }).toList();
                    controller.transaction.clear();
                    controller.transaction.addAll(filterTransactions);
                    Get.back();
                  },
                ),
              ),
              SizedBox(height: 5.v),
              Center(
                child: Text(
                  'Resetta filtri',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
