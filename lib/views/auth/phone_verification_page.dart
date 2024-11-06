import 'package:flutter/material.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/controllers/phone_verification_controller.dart';
import 'package:foodly/services/verification_service.dart';
import 'package:get/get.dart';
import 'package:phone_otp_verification/phone_verification.dart';

class PhoneVerificationPage extends StatefulWidget {
  const PhoneVerificationPage({super.key});

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  VerificationService _verificationService = VerificationService();

  String _verificationId = '';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhoneVerificationController());
    return Obx(() => controller.isLoading == false
        ? PhoneVerification(
            isFirstPage: false,
            enableLogo: false,
            themeColor: kPrimary,
            backgroundColor: kLightWhite,
            initialPageText: "Verify Phone Number",
            initialPageTextStyle: appStyle(20, kPrimary, FontWeight.bold),
            textColor: kDark,
            onSend: (String value) {
              controller.setPhoneNumber = value;
              _verifyPhoneNumber(value);
            },
            onVerification: (String value) {
              _submitVerificationCode(value);
            },
          )
        : Container(
          color: kLightWhite,
          width: width,
          height: height,
          child: const Center(
              child: CircularProgressIndicator(),
            ),
        ));
  }

  void _verifyPhoneNumber(String phoneNumber) async {
    final controller = Get.put(PhoneVerificationController());

    await _verificationService.verifyPhoneNumber(controller.phone,
        codeSent: (String verificationId, int? resendToken) {
      setState(() {
        _verificationId = verificationId;
      });
    });
  }

  void _submitVerificationCode(String code) async {
    await _verificationService.verifySmsCode(_verificationId, code);
  }
}
