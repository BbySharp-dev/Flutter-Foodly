 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/custom_button.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/views/auth/phone_verification_page.dart';
import 'package:get/get.dart';

Future<dynamic> showVerificationSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        showDragHandle: true,
        builder: (BuildContext context) {
          return Container(
            height: 500.h,
            width: width,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/restaurant_bk.png"),
                  fit: BoxFit.fill),
              color: kLightWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  ReusableText(
                      text: "Verify Your Phone Number",
                      style: appStyle(18, kPrimary, FontWeight.w600)),
                  SizedBox(
                      height: 250.h,
                      child: Column(
                        children:
                            List.generate(verificationReasons.length, (index) {
                          return ListTile(
                            leading: const Icon(
                              Icons.check_circle_outline,
                              color: kPrimary,
                            ),
                            title: Text(
                              verificationReasons[index],
                              textAlign: TextAlign.justify,
                              style:
                                  appStyle(11, kGrayLight, FontWeight.normal),
                            ),
                          );
                        }),
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomButton(
                    text: "Verify  Phone Number",
                    btnHeight: 35.h,
                    onTap: () {
                      Get.to(() => const PhoneVerificationPage());
                    },
                  )
                ],
              ),
            ),
          );
        });
  }