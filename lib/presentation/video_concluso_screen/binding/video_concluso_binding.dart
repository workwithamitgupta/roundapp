import '../controller/video_concluso_controller.dart';
import 'package:get/get.dart';

/// A binding class for the VideoConclusoScreen.
///
/// This class ensures that the VideoConclusoController is created when the
/// VideoConclusoScreen is first loaded.
class VideoConclusoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoConclusoController());
  }
}
