import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sber_sign_test/components/sber_icons.dart';
import 'package:sber_sign_test/styles/colors.dart';
import 'package:sber_sign_test/styles/typography.dart';

class ProfileButton extends StatelessWidget {
  final String fullName;
  const ProfileButton({super.key, required this.fullName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            SberCText(
              fullName,
              color: SberColors.primaryGaphitSber,
            ),
            const SizedBox(width: 8),
            const CircleAvatar(
              backgroundColor: SberColors.coolGray,
              maxRadius: 16,
              child: SberIconProfile(
                color: SberColors.primaryWhite,
              ),
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(
              'assets/svg_icons/ic_chevron_down.svg',
              height: 15,
            ),
          ],
        ),
      ],
    );
  }
}
