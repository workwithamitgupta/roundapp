import '../../../core/app_export.dart';
import 'userprofile1_item_model.dart';
import 'userprofile2_item_model.dart';

/// This class defines the variables used in the [android_six_page],
/// and is typically used to hold data that is passed between different parts of the application.
class AndroidSixModel {
  Rx<List<Userprofile1ItemModel>> userprofile1ItemList = Rx([
    Userprofile1ItemModel(
        userImage: "€ 0,021".obs,
        title: "Trapp, il tappetino che fa da personal trainer".obs,
        subtitle: "Attrezzature".obs),
    Userprofile1ItemModel(
        userImage: "€ 0,021".obs,
        title: "Trapp, il tappetino che fa da personal trainer".obs,
        subtitle: "Attrezzature".obs),
    Userprofile1ItemModel(
        title: "Trapp, il tappetino che fa da personal trainer".obs,
        subtitle: "Attrezzature".obs)
  ]);

  Rx<List<Userprofile2ItemModel>> userprofile2ItemList = Rx([
    Userprofile2ItemModel(
        twentyOneText: "€ 0,021".obs,
        trappIlTappetinoText:
            "Trapp, il tappetino che fa da personal trainer".obs,
        attrezzatureText: "Attrezzature".obs),
    Userprofile2ItemModel(
        trappIlTappetinoText:
            "Trapp, il tappetino che fa da personal trainer".obs,
        attrezzatureText: "Attrezzature".obs),
    Userprofile2ItemModel(
        trappIlTappetinoText:
            "Trapp, il tappetino che fa da personal trainer".obs,
        attrezzatureText: "Attrezzature".obs)
  ]);
}
