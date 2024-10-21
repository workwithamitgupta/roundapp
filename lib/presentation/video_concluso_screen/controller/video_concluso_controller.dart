import 'package:round_app/core/app_export.dart';
import 'package:round_app/presentation/video_concluso_screen/models/video_concluso_model.dart';

/// A controller class for the VideoConclusoScreen.
///
/// This class manages the state of the VideoConclusoScreen, including the
/// current videoConclusoModelObj
class VideoConclusoController extends GetxController {
  Rx<VideoConclusoModel> videoConclusoModelObj = VideoConclusoModel().obs;
}
