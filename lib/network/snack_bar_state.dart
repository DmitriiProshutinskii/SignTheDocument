import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sber_sign_test/styles/colors.dart';
import 'package:sber_sign_test/styles/typography.dart';

class SnackBarState {
  static final GlobalKey<ScaffoldMessengerState> snackbarKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showErrorSnackbar(String title, String message,
      {SnackBarAction? action}) {
    final SnackBar snackBar = SnackBar(
        backgroundColor: SberColors.transparent,
        dismissDirection: DismissDirection.endToStart,
        elevation: 0,
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: SberColors.primaryWhite,
            border: Border.all(color: SberColors.red4),
          ),
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/svg_icons/ic_cross_in_circle.svg',
                color: SberColors.red4,
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SberH5Text("Error", color: SberColors.red4),
                  SberB3Text(message, color: SberColors.red4),
                ],
              ),
            ],
          ),
        ));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  static void hideCurrentSnackBar() {
    snackbarKey.currentState?.hideCurrentSnackBar();
  }
}
