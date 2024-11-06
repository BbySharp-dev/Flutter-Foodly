import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
String googleApiKey = 'AIzaSyCB9l9_g19L2B70sA3QXhOKQewNvcNPPRs';

const kPrimary = Color(0xff008A80);
const kPrimaryLight = Color(0xFF40F3EA);
const kSecondary = Color(0xffffa44f);
const kSecondaryLight = Color(0xFFffe5db);
const kTertiary = Color(0xff0078a6);
const kGray = Color(0xff83829A);
const kGrayLight = Color(0xffC1C0C8);
const kLightWhite = Color(0xffFAFAFC);
const kWhite = Color(0xfffFFFFF);
const kDark = Color(0xff000000);
const kRed = Color(0xffe81e4d);
const kOffWhite = Color(0xffF3F4F8);

double height = 825.h;
double width = 375.w;


const String appBaseUrl = "http://localhost:6004";

final List<String> verificationReasons = [
  'Real-time Updates: Get instant notifications about your order status.',
  'Direct Communication: A verified number ensures seamless communication.',
  'Enhanced Security: Protect your account and confirm orders securely.',
  'Effortless Rescheduling: Easily address issues with a quick call.',
  'Exclusive Offers: Stay in the loop for special deals and promotions.'
];

List<String> orderList = [
  "Pending",
  "Preparing",
  "Delivering",
  "Delivered",
  "Cancelled",
];

List<String> reasonsToAddAddress = [
  "Ensures that food orders are delivered accurately to the customer’s location.",
  "Allows users to check if the delivery service is available in their area.",
  "Provides a personalized experience by showing nearby restaurants, estimated delivery times, and special offers.",
  "Streamlines the checkout process by saving addresses for quicker order placement.",
  "Enables management of multiple addresses (e.g., home, work) for easy switching.",
];
