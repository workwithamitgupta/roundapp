import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';
import 'package:round_app/data/models/video_model.dart';

class SearchViewController extends GetxController {
  var searchController = ''.obs;
  var sController = TextEditingController();

  bool isVisible(VideosData item) {
    if (searchController.value.isEmpty) {
      return true;
    }
    if (item.tags!.firstWhereOrNull((element) => element.code
                .toString()
                .toLowerCase()
                .contains(searchController.value.toLowerCase())) !=
            null ||
        item.title!
            .toLowerCase()
            .contains(searchController.value.toLowerCase())) {
      return true;
    } else {
      return false;
    }
  }
}
