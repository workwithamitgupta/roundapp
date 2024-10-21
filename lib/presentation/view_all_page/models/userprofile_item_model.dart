import '../../../core/app_export.dart';

/// This class is used in the [userprofile_item_widget] screen.
class UserprofileItemModel {
  UserprofileItemModel({
    this.imagePrice,
    this.textPrice,
    this.textSubtitle,
    this.textEquipment,
    this.id,
  }) {
    imagePrice = imagePrice ?? Rx(ImageConstant.imgRectangle5);
    textPrice = textPrice ?? Rx("€ 0,021");
    textSubtitle =
        textSubtitle ?? Rx("8fit, compagno di allenamento a domicilio");
    textEquipment = textEquipment ?? Rx("Attrezzature");
    id = id ?? Rx("");
  }

  Rx<String>? imagePrice;

  Rx<String>? textPrice;

  Rx<String>? textSubtitle;

  Rx<String>? textEquipment;

  Rx<String>? id;
}
