import '../../../core/app_export.dart';

/// This class is used in the [userprofile2_item_widget] screen.
class Userprofile2ItemModel {
  Userprofile2ItemModel({
    this.twentyOneText,
    this.trappIlTappetinoText,
    this.attrezzatureText,
    this.id,
  }) {
    twentyOneText = twentyOneText ?? Rx("€ 0,021");
    trappIlTappetinoText = trappIlTappetinoText ??
        Rx("Trapp, il tappetino che fa da personal trainer");
    attrezzatureText = attrezzatureText ?? Rx("Attrezzature");
    id = id ?? Rx("");
  }

  Rx<String>? twentyOneText;

  Rx<String>? trappIlTappetinoText;

  Rx<String>? attrezzatureText;

  Rx<String>? id;
}
