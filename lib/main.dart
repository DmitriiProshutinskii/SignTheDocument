import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sber_sign_test/pages/not_found_page/not_found_page.dart';
import 'package:sber_sign_test/pages/sign_verification/sign_verification_binding.dart';
import 'package:sber_sign_test/pages/sign_verification/sign_verification_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: '/home',
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const NotFoundPage());
      },
      getPages: [
        GetPage(
          name: '/home',
          page: () => const SignVerificationPage(),
          binding: SignVerificationBinding(),
        ),
      ],
    ),
  );
}
