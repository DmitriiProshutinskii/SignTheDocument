import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sber_sign_test/styles/colors.dart';
import 'package:sber_sign_test/styles/typography.dart';

class SignDocsIcon extends StatelessWidget {
  final int count;
  const SignDocsIcon({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: SberColors.lightGray,
      ),
      child: SizedBox(
        child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg_icons/ic_signification.svg',
                color: SberColors.electricBlue4,
              ),
              const SizedBox(width: 6),
              SberB3Text('$count', color: SberColors.primaryGaphitSber)
            ]),
      ),
    );
  }
}
