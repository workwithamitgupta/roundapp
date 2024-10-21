import 'package:round_app/core/app_export.dart';
import 'package:round_app/presentation/onb_4_1_interessi_selezionati_screen/models/onb_4_1_interessi_selezionati_model.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/video_model.dart';

class Onb41InteressiSelezionatiController extends GetxController {
  Rx<Onb41InteressiSelezionatiModel> onb41InteressiSelezionatiModelObj =
      Onb41InteressiSelezionatiModel().obs;

  List<Tag> tags = <Tag>[].obs;

  List<String> selectedTag = <String>[].obs;

  @override
  void onInit() {
    ApiClient.getTagList().then((value) {
      tags.assignAll(value);
      print('Tag=====>');
    });
    selectedTag.assignAll(PrefUtils.getTag());
    super.onInit();
  }
}
