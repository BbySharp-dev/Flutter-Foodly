// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxString _category = ''.obs;

  String get categoryValue => _category.value;

  set updateCategory(String value) {
    _category.value = value;
  }

  RxString _title = ''.obs;

  String get titleValue => _title.value;

  set updateTitle(String value) {
    _title.value = value;
  }
}
