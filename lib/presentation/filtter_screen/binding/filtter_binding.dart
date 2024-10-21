import '../controller/filtter_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FiltterScreen.
///
/// This class ensures that the FiltterController is created when the
/// FiltterScreen is first loaded.
class FiltterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FiltterController());
  }
}
