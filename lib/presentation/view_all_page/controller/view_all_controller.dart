import 'package:round_app/core/app_export.dart';
import 'package:round_app/presentation/view_all_page/models/view_all_model.dart';

/// A controller class for the ViewAllPage.
///
/// This class manages the state of the ViewAllPage, including the
/// current viewAllModelObj
class ViewAllController extends GetxController {
  ViewAllController(this.viewAllModelObj);

  Rx<ViewAllModel> viewAllModelObj;
}
