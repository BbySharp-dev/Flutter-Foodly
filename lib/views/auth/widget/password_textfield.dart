import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/controllers/password_controller.dart';
import 'package:get/get.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordController());
    return Obx(() => TextFormField(
          cursorColor: kDark,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.visiblePassword,
          controller: controller,
          obscureText: passwordController.password,
          validator: (value) {
            if (value!.isEmpty) {
              return "Please enter valid password";
            } else {
              return null;
            }
          },
          style: appStyle(12, kDark, FontWeight.normal),
          decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: const Icon(
                CupertinoIcons.lock_circle,
                size: 26,
                color: kGrayLight,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  passwordController.setPassword = !passwordController.password;
                },
                child: Icon(
                  passwordController.password
                      ? Icons.visibility
                      : Icons.visibility_off,
                  size: 26,
                  color: kGrayLight,
                ),
              ),
              isDense: true,
              contentPadding: EdgeInsets.all(6.h),
              hintStyle: appStyle(12, kGray, FontWeight.normal),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kRed, width: .5),
                  borderRadius: BorderRadius.all(Radius.circular(12.r))),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kPrimary, width: .5),
                  borderRadius: BorderRadius.all(Radius.circular(12.r))),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kRed, width: .5),
                  borderRadius: BorderRadius.all(Radius.circular(12.r))),
              disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kGray, width: .5),
                  borderRadius: BorderRadius.all(Radius.circular(12.r))),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kPrimary, width: .5),
                  borderRadius: BorderRadius.all(Radius.circular(12.r))),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: kPrimary, width: .5),
                  borderRadius: BorderRadius.all(Radius.circular(12.r)))),
        ));
  }
}
