import 'package:flutter/material.dart';
import 'package:sber_sign_test/components/app_bar/online_sign_logo.dart';
import 'package:sber_sign_test/components/app_bar/profile_button.dart';
import 'package:sber_sign_test/components/app_bar/sign_documents_icon.dart';
import 'package:sber_sign_test/styles/colors.dart';

class SberAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SberAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: SberColors.primaryWhite,
      leading: const SignOnlineLogo(),
      leadingWidth: 200,
      actions: const [
        SignDocsIcon(count: 12),
        SizedBox(width: 8),
        VerticalDivider(
          indent: 12,
          endIndent: 12,
        ),
        SizedBox(width: 8),
        ProfileButton(
          fullName: 'Дмитрий Прошутинский',
        ),
        SizedBox(width: 32),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 52);
}
