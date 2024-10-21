// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:round_app/core/app_export.dart';
import 'package:round_app/presentation/profile_screen/controller/profile_controller.dart';
import 'package:round_app/presentation/profile_screen/profile_screen.dart';
import 'package:round_app/presentation/search_screen/views/search_view.dart';
import 'package:round_app/presentation/view_all_page/view_all_page.dart';
import 'package:round_app/widgets/app_bar/appbar_title.dart';
import 'package:round_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:round_app/widgets/app_bar/custom_app_bar.dart';

import '../android_six_page/widgets/userprofile1_item_widget.dart';
import '../withdraw_screen/withdraw_screen.dart';
import 'controller/android_six_controller.dart';
import 'models/android_six_model.dart';
import 'models/userprofile1_item_model.dart';

class AndroidSixPage extends StatelessWidget {
  AndroidSixPage({Key? key}) : super(key: key);

  AndroidSixController controller =
      Get.put(AndroidSixController(AndroidSixModel().obs));
  List<Widget> selectedPage = [HomeBodyView(), SearchView(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: selectedPage[controller.selectedIndex.value],
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            items: [
              BottomNavigationBarItem(label: '', icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: '', icon: Icon(Icons.search)),
              BottomNavigationBarItem(label: '', icon: Icon(Icons.person)),
            ],
            onTap: (val) {
              controller.selectedIndex.value = val;
            },
          ),
        ),
      ),
    );
  }
}

class HomeBodyView extends StatelessWidget {
  HomeBodyView({Key? key}) : super(key: key);
  AndroidSixController controller =
      Get.put(AndroidSixController(AndroidSixModel().obs));
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SizedBox(
        width: SizeUtils.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: Text(
                    "lbl_i_tuoi_guadagni".tr,
                    style: CustomTextStyles.titleMediumSemiBold,
                  ),
                ),
              ),
              SizedBox(height: 15.v),
              _buildSeventy(),
              SizedBox(height: 23.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.h),
                child: _buildSixtySix(
                  allenamento: "lbl_allenamento".tr,
                  vediTutti: "lbl_vedi_tutti".tr,
                ),
              ),
              SizedBox(height: 16.v),
              _buildUserProfile(),
              SizedBox(height: 23.v),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 19.h),
              //   child: _buildSixtySix(
              //     allenamento: "lbl_allenamento".tr,
              //     vediTutti: "lbl_vedi_tutti".tr,
              //   ),
              // ),
              // // SizedBox(height: 16.v),
              //_buildUserProfile1(),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 86.v,
      title: Obx(
        () => AppbarTitle(
          text: "Ciao ${profileController.user.value.data?.name ?? ''}",
          //"lbl_ciao_mario".tr,
          margin: EdgeInsets.only(left: 20.h),
        ),
      ),
      actions: [
        Obx(
          () => Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AppbarTrailingImage(
                imagePath: profileController.user.value.data?.image != null
                    ? profileController.user.value.data?.image!.url
                    : ImageConstant.personNetworkImage,
                fit: BoxFit.cover,
                //ImageConstant.imgPlay,
                // margin: EdgeInsets.symmetric(horizontal: 20.h),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSeventy() {
    return Container(
      width: 320.h,
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 23.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
        image: DecorationImage(
          image: fs.Svg(
            ImageConstant.imgGroup70,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => _buildFrame(
              dynamicText: "lbl_totale".tr,
              dynamicText1: "€" + profileController.total.value.toString(),
            ),
          ),
          SizedBox(width: 10.v),
          Obx(
            () => _buildFrame(
              dynamicText: "lbl_oggi".tr,
              dynamicText1: "€" + profileController.today.value.toString(),
            ),
          ),
          Spacer(
            flex: 33,
          ),
          Spacer(
            flex: 66,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => WithdrawScreen());
              // Get.toNamed(AppRoutes.paymentTransferScreen);
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.greenAccent, shape: BoxShape.circle),
              child: Icon(Icons.arrow_forward),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile() {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 178.v,
        child: Obx(
          () => ListView.separated(
            padding: EdgeInsets.only(left: 20.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 16.h,
              );
            },
            itemCount: controller.videos?.length ?? 0,
            itemBuilder: (context, index) {
              Userprofile1ItemModel model = Userprofile1ItemModel()
                ..userImage =
                    Rx(controller.videos![index].video!.image?.url ?? '')
                ..id = Rx(controller.videos![index].id ?? 0)
                ..title = Rx(controller.videos![index].title ?? '')
                ..budget =
                    Rx('€ ' + controller.videos![index].budget.toString())
                ..url = Rx(controller.videos![index].video!.url.toString())
                ..subtitle =
                    Rx(controller.videos![index].description.toString())
                ..reward = Rx(controller.videos![index].reward ?? 0.0);

              var tags = PrefUtils.getTag();

              return Visibility(
                visible: tags.length == 0
                    ? true
                    : controller.videos![index].tags!.firstWhereOrNull(
                            (element) => tags.contains(element.code)) !=
                        null,
                child: Userprofile1ItemWidget(
                  model,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildFrame({
    required String dynamicText,
    required String dynamicText1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dynamicText,
          style: CustomTextStyles.titleSmallSecondaryContainer.copyWith(
            color: theme.colorScheme.secondaryContainer,
          ),
        ),
        SizedBox(height: 6.v),
        Text(
          dynamicText1,
          style: CustomTextStyles.titleMediumSecondaryContainer.copyWith(
            color: theme.colorScheme.secondaryContainer,
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildSixtySix({
    required String allenamento,
    required String vediTutti,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          allenamento,
          style: CustomTextStyles.titleMediumSemiBold.copyWith(
            color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(() => ViewAllPage());
          },
          child: Text(
            vediTutti,
            style: CustomTextStyles.titleMediumOnPrimary.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
