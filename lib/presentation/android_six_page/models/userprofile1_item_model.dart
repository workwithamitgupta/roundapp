import '../../../core/app_export.dart';

/// This class is used in the [userprofile1_item_widget] screen.
class Userprofile1ItemModel {
  Userprofile1ItemModel({
    this.userImage,
    this.title,
    this.subtitle,
    this.id,
    this.budget,
    this.url,
    this.reward,
  }) {
    userImage = userImage ?? Rx("");
    title = title ?? Rx("Trapp, il tappetino che fa da personal trainer");
    subtitle = subtitle ?? Rx("Attrezzature");
    id = id ?? Rx(0);
    budget = budget ?? Rx('');
    url = url ?? Rx('');
    reward = reward ?? Rx(0.0);
  }

  Rx<String>? userImage;

  Rx<String>? title;

  Rx<String>? budget;

  Rx<String>? subtitle;

  Rx<String>? url;

  Rx<int>? id;

  Rx<double>? reward;
}
