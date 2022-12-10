import 'package:flutter/material.dart';
import 'package:sber_sign_test/styles/colors.dart';
import 'package:sber_sign_test/styles/typography.dart';

class SnackBarState {
  static final GlobalKey<ScaffoldMessengerState> snackbarKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showErrorSnackbar(String message, {SnackBarAction? action}) {
    final SnackBar snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: SberColors.lightGray,
      duration: const Duration(seconds: 3),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SberH3Text("Error", color: SberColors.primaryBlack),
          SberB2Text(message, color: SberColors.primaryBlack),
        ],
      ),
      action: action,
      dismissDirection: DismissDirection.horizontal,
      // content: Text("hello!"),
    );
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  static void hideCurrentSnackBar() {
    snackbarKey.currentState?.hideCurrentSnackBar();
  }
}
