import '../../../core/app_export.dart';

/// This class defines the variables used in the [filtter_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FiltterModel {
  Rx<List<String>> radioList = Rx(
      ["msg_ultima_settimana", "lbl_ultima_mese", "msg_seleziona_intervallo"]);
}
