import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';
import 'package:round_app/presentation/search_screen/controllers/searchview_controller.dart';

import '../../android_six_page/controller/android_six_controller.dart';
import '../../android_six_page/models/android_six_model.dart';
import '../../android_six_page/models/userprofile1_item_model.dart';
import '../../view_all_page/widgets/userprofile_item_widget.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);
  final controller = Get.put(SearchViewController());
  AndroidSixController androidSixController =
      Get.put(AndroidSixController(AndroidSixModel().obs));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cosa vuoi vedere?'.tr),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0.v),
            child: Column(children: [
              TextFormField(
                controller: controller.sController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: InkWell(
                      onTap: () {
                        controller.sController.clear();
                        controller.searchController.value = '';
                      },
                      child: Icon(Icons.close)),
                  hintText: 'Search',
                ),
                onChanged: (val) {
                  controller.searchController.value = val;
                  print(val);
                },
              ),
              SizedBox(height: 10.h),
              _buildUserProfile()
              // Column(
              //   children: [
              //     Icon(
              //       Icons.search,
              //       color: Colors.blue,
              //       size: 80.v,
              //     ),
              //     Text(
              //       'Nessun risultato travato'.tr,
              //       style: theme.textTheme.headlineSmall!
              //           .copyWith(color: Colors.lightBlue),
              //     ),
              //     SizedBox(height: 10.h),
              //     Text(
              //       'La ricerca non ha prodotto nessun risultato, controlla il testo inserito, riprova.'
              //           .tr,
              //       textAlign: TextAlign.center,
              //       style:
              //           theme.textTheme.headlineSmall!.copyWith(fontSize: 20),
              //     ),
              //   ],
              // )
            ]),
          ),
        ));
  }

  /// Section Widget
  Widget _buildUserProfile() {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Obx(() => ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 24.v);
                },
                itemCount: androidSixController.videos?.length ?? 0,
                //  controller
                //     .viewAllModelObj.value.userprofileItemList.value.length,
                itemBuilder: (context, index) {
                  Userprofile1ItemModel model = Userprofile1ItemModel()
                    ..userImage = Rx(
                        androidSixController.videos![index].video!.image?.url ??
                            '')
                    ..id = Rx(androidSixController.videos![index].id ?? 0)
                    ..title =
                        Rx(androidSixController.videos![index].title ?? '')
                    ..budget = Rx('€ ' +
                        androidSixController.videos![index].budget.toString())
                    ..url = Rx(androidSixController.videos![index].video!.url
                        .toString())
                    ..subtitle = Rx(androidSixController
                        .videos![index].description
                        .toString());
                  // UserprofileItemModel model = controller
                  //     .viewAllModelObj.value.userprofileItemList.value[index];
                  return Obx(
                    () => Visibility(
                        visible: controller.searchController.isEmpty
                            ? true
                            : controller
                                .isVisible(androidSixController.videos![index]),
                        child: UserprofileItemWidget(model)),
                  );
                }))));
  }
}
