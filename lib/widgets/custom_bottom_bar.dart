import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    this.onChanged,
  }) : super(
          key: key,
        );

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgGroup2,
      activeIcon: ImageConstant.imgGroup2,
      type: BottomBarEnum.Group2,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgGroup2,
      activeIcon: ImageConstant.imgGroup2,
      type: BottomBarEnum.Group2,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgIconsProfileActive,
      activeIcon: ImageConstant.imgIconsProfileActive,
      type: BottomBarEnum.Iconsprofileactive,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83.v,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.08),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              -8,
            ),
          ),
        ],
      ),
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: CustomImageView(
                imagePath: bottomMenuList[index].icon,
                height: 49.v,
                width: 72.h,
                color: theme.colorScheme.secondaryContainer,
              ),
              activeIcon: Container(
                decoration: AppDecoration.fillSecondaryContainer,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 3.v),
                      child: SizedBox(
                        width: 51.h,
                        child: Divider(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    CustomImageView(
                      imagePath: bottomMenuList[index].activeIcon,
                      height: 26.adaptSize,
                      width: 26.adaptSize,
                      color: theme.colorScheme.onPrimary,
                      margin: EdgeInsets.only(
                        top: 5.v,
                        bottom: 12.v,
                      ),
                    ),
                  ],
                ),
              ),
              label: '',
            );
          }),
          onTap: (index) {
            selectedIndex.value = index;
            onChanged?.call(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Group2,
  Iconsprofileactive,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
