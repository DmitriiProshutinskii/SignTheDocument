import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sber_sign_test/configs/routes.dart';
import 'package:sber_sign_test/network/snack_bar_state.dart';
import 'package:sber_sign_test/pages/error_page/error_base_page.dart';
import 'package:sber_sign_test/pages/error_page/error_binding.dart';
import 'package:sber_sign_test/pages/sign_verification/sign_verification_binding.dart';
import 'package:sber_sign_test/pages/sign_verification/sign_verification_page.dart';

void main() {
  List<GetPage<dynamic>> getPages = [
    GetPage(
      name: Routes.initial,
      page: () => const SignVerificationPage(),
      binding: SignVerificationBinding(),
    ),
    GetPage(
      name: Routes.error,
      page: () => const ErrorBasePage(),
      binding: ErrorBinding(),
    ),
  ];

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const ErrorBasePage());
      },
      scaffoldMessengerKey: SnackBarState.snackbarKey,
      getPages: getPages,
    ),
  );
}
