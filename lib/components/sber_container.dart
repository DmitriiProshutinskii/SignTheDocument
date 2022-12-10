import 'package:flutter/material.dart';

import 'package:sber_sign_test/styles/colors.dart';

class SberContainer extends StatelessWidget {
  final Widget child;

  const SberContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
