// ignore_for_file: prefer_final_fields

import 'package:foodly/models/additive_obs.dart';
import 'package:foodly/models/foods_model.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  RxInt currrentPage = 0.obs;
  bool initialCheckValue = false;
  var additivesList = <AdditiveObs>[].obs;

  void changePage(int index) {
    currrentPage.value = index;
  }

  RxInt count = 1.obs;

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

  void loadAdditives(List<Additive> additives) {
    additivesList.clear();

    for (var additiveInfo in additives) {
      var additive = AdditiveObs(
        id: additiveInfo.id,
        title: additiveInfo.title,
        price: additiveInfo.price,
        checked: initialCheckValue,
      );
      if (additives.length == additivesList.length) {
      } else {
        additivesList.add(additive);
      }
    }
  }

  List<String> getCartAdditive() {
    List<String> additives = [];

    for (var addtive in additivesList) {
      if (addtive.isChecked.value && !additives.contains(addtive.title)) {
        additives.add(addtive.title);
      } else if(!addtive.isChecked.value && additives.contains(addtive.title)) {
        additives.remove(addtive.title);

      }
    }
    return additives;
  }

  RxDouble _totalPrice = 0.0.obs;

  double get additivePrice => _totalPrice.value;

  set setTotalPrice(double newPrice) {
    _totalPrice.value = newPrice;
  }

  double getTotalPrice() {
    double totalPrice = 0.0;

    for (var additive in additivesList) {
      if (additive.isChecked.value) {
        totalPrice += double.tryParse(additive.price) ?? 0.0;
      }
    }

    setTotalPrice = totalPrice;
    return totalPrice;
  }
}
