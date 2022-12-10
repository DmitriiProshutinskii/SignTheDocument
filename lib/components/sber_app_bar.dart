import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sber_sign_test/styles/colors.dart';
import 'package:sber_sign_test/styles/typography.dart';

class SberAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SberAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: SberColors.primaryWhite,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SberH3Text('Онлайн-Подпись'),
        ],
      ),
      leadingWidth: 200,
      actions: [
        const _NewDocs(),
        const SizedBox(width: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SberCText(
              'Елизавета Киселева',
              color: SberColors.primaryGaphitSber,
            ),
          ],
        ),
        const SizedBox(width: 32),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 52);
}

class _NewDocs extends StatelessWidget {
  const _NewDocs();

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
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          SvgPicture.asset(
            'assets/svg_icons/ic_signification.svg',
            color: SberColors.electricBlue4,
          ),
          const SizedBox(width: 8),
          const SberB3Text('12', color: SberColors.primaryGaphitSber)
        ]),
      ),
    );
  }
}
