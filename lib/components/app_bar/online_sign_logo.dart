import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignOnlineLogo extends StatelessWidget {
  const SignOnlineLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SvgPicture.asset('assets/svg_icons/online_sign_text.svg'),
        Image.asset('assets/png_icons/sber_icon.png', width: 40),
      ],
    );
  }
}
