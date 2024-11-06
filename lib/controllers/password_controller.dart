import 'package:get/get.dart';

class PasswordController extends GetxController {
  RxBool _password = false.obs;

  bool get password => _password.value;

  set setPassword(bool newState) {
    _password.value = newState;
  }
}
