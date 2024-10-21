import '../../../core/app_export.dart';
import 'userprofile_item_model.dart';

/// This class defines the variables used in the [view_all_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ViewAllModel {
  Rx<List<UserprofileItemModel>> userprofileItemList = Rx([
    UserprofileItemModel(
        imagePrice: ImageConstant.imgRectangle5.obs,
        textPrice: "€ 0,021".obs,
        textSubtitle: "8fit, compagno di allenamento a domicilio".obs,
        textEquipment: "Attrezzature".obs),
    UserprofileItemModel(
        imagePrice: ImageConstant.imgRectangle5170x320.obs,
        textPrice: "€ 0,021".obs,
        textSubtitle: "A casa come in palestra con Technogym persona".obs,
        textEquipment: "Attrezzature".obs)
  ]);
}
