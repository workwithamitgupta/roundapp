import 'package:round_app/core/app_export.dart';
import 'package:round_app/data/apiClient/api_client.dart';
import 'package:round_app/presentation/android_six_page/models/android_six_model.dart';

import '../../../data/models/video_model.dart';

class AndroidSixController extends GetxController {
  AndroidSixController(this.androidSixModelObj);

  Rx<AndroidSixModel> androidSixModelObj;
  var selectedIndex = 0.obs;
  List<VideosData>? videos = <VideosData>[].obs;

  @override
  void onInit() {
    super.onInit();
    ApiClient.fetchVideo().then((value) {
      videos!.assignAll(value!.data ?? <VideosData>[]);
    });
  }
}
