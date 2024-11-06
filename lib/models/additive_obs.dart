import 'package:get/get.dart';

class AdditiveObs extends GetxController {
  final int id;
  final String title;
  final String price;
  RxBool isChecked = false.obs;

  AdditiveObs({
    required this.id,
    required this.title,
    required this.price,
    bool checked = false,
  }){
    isChecked.value = checked;
  }

  void toggleChecked() {
    isChecked.value = !isChecked.value;
  }
}
