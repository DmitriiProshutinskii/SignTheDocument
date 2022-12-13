import 'package:flutter/material.dart';

import 'package:sber_sign_test/styles/colors.dart';

class SberContainer extends StatelessWidget {
  final Widget child;
  final double? width;

  const SberContainer({
    Key? key,
    required this.child,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: SberColors.primaryWhite,
        border: Border.all(color: SberColors.formBorder),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 32),
      child: child,
    );
  }
}
