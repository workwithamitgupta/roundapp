import '../controller/onb_4_1_interessi_selezionati_controller.dart';
import 'package:get/get.dart';

/// A binding class for the Onb41InteressiSelezionatiScreen.
///
/// This class ensures that the Onb41InteressiSelezionatiController is created when the
/// Onb41InteressiSelezionatiScreen is first loaded.
class Onb41InteressiSelezionatiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Onb41InteressiSelezionatiController());
  }
}
