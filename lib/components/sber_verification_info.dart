import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sber_sign_test/styles/colors.dart';
import 'package:sber_sign_test/styles/typography.dart';

class SberInfoAlert extends StatelessWidget {
  final Color bgColor;
  final Color borderColor;
  final Widget leadingIcon;
  final String title;
  final String? description;
  const SberInfoAlert({
    super.key,
    required this.bgColor,
    required this.borderColor,
    required this.leadingIcon,
    required this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          leadingIcon,
          const SizedBox(width: 16),
          SberH5Text(title),
          if (description != null) SberB2Text(description!)
        ],
      ),
    );
  }
}

class SberInfoAlertSuccess extends StatelessWidget {
  const SberInfoAlertSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return SberInfoAlert(
      bgColor: SberColors.greenTeaSber,
      borderColor: SberColors.green5Sber,
      title: 'Подпись принадлежит документу',
      leadingIcon: SvgPicture.asset(
        'assets/svg_icons/ic_check_in_circle.svg',
        color: SberColors.green5Sber,
      ),
    );
  }
}

class SberInfoAlertFailed extends StatelessWidget {
  const SberInfoAlertFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return SberInfoAlert(
      bgColor: SberColors.redLight,
      borderColor: SberColors.red4,
      title: 'Подпись не принадлежит документу',
      leadingIcon: SvgPicture.asset(
        'assets/svg_icons/ic_cross_in_circle.svg',
        color: SberColors.red4,
      ),
    );
  }
}
