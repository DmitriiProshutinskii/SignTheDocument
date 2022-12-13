import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:sber_sign_test/configs/routes.dart';

class SignOnlineLogo extends StatelessWidget {
  const SignOnlineLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 10,
      padding: EdgeInsets.zero,
      onPressed: toMain,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SvgPicture.asset('assets/svg_icons/online_sign_text.svg'),
          Image.asset('assets/png_icons/sber_icon.png', width: 40),
        ],
      ),
    );
  }

  void toMain() {
    Get.offNamed(Routes.initial);
  }
}
