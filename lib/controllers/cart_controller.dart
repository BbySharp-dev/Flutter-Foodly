import 'package:flutter/material.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/models/api_eror.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  final box = GetStorage();
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  void addToCart(String cart) async {
    setLoading = true;

    String accessToken = box.read("token");

    var url = Uri.parse("$appBaseUrl/api/cart");

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.post(url, headers: headers, body: cart);

      if (response.statusCode == 201) {
        setLoading = false;

        Get.snackbar("Added to cart", "Enjoy your awesome experience",
            colorText: kLightWhite,
            backgroundColor: kPrimary,
            icon: const Icon(
              Icons.check_circle_outline,
              color: kLightWhite,
            ));
      } else {
        var error = apiErrorFromJson(response.body);

        Get.snackbar("Error", error.message,
            colorText: kLightWhite,
            backgroundColor: kRed,
            icon: const Icon(
              Icons.error_outline,
              color: kLightWhite,
            ));
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading = false;
    }
  }


    void removeFrom(String productId, Function refetch) async {
    setLoading = true;

    String accessToken = box.read("token");

    var url = Uri.parse("$appBaseUrl/api/cart/$productId");

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.delete(url, headers: headers);

      if (response.statusCode == 200) {
          setLoading = false;
          refetch();
        Get.snackbar("Product removed successfully", "Enjoy your awesome experience",
            colorText: kLightWhite,
            backgroundColor: kPrimary,
            icon: const Icon(
              Icons.check_circle_outline,
              color: kLightWhite,
            ));
      } else {
        var error = apiErrorFromJson(response.body);

        Get.snackbar("Error", error.message,
            colorText: kLightWhite,
            backgroundColor: kRed,
            icon: const Icon(
              Icons.error_outline,
              color: kLightWhite,
            ));
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading = false;
    }
  }
}
