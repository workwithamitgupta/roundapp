import '../../../core/app_export.dart';
import 'fortyfour_item_model.dart';
import 'fortyone_item_model.dart';

/// This class defines the variables used in the [onb_4_1_interessi_selezionati_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class Onb41InteressiSelezionatiModel {
  Rx<List<FortyoneItemModel>> fortyoneItemList =
      Rx(List.generate(3, (index) => FortyoneItemModel()));

  Rx<List<FortyfourItemModel>> fortyfourItemList =
      Rx(List.generate(9, (index) => FortyfourItemModel()));
}
