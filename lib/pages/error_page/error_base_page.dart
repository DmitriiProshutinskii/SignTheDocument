import 'package:flutter/material.dart';
import 'package:sber_sign_test/components/app_bar/sber_app_bar.dart';
import 'package:sber_sign_test/components/sber_buttons.dart';
import 'package:sber_sign_test/components/sber_container.dart';
import 'package:sber_sign_test/pages/error_page/error_controller.dart';
import 'package:sber_sign_test/styles/colors.dart';
import 'package:sber_sign_test/styles/typography.dart';

import 'package:get/get.dart';

class ErrorBasePage extends GetView<ErrorController> {
  const ErrorBasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SberColors.snowSber,
      appBar: const SberAppBar(),
      body: Center(
        child: GetBuilder<ErrorController>(
          builder: (ErrorController controller) {
            return SberContainer(
              width: 440,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${controller.statusCode ?? '🤷'}',
                      style: TextStyle(
                        fontFamily: 'SBSansDisplay',
                        fontSize: controller.statusCode != null ? 120 : 55,
                        fontWeight: FontWeight.w900,
                        color: SberColors.electricBlue75,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SberH3Text(controller.title),
                    SberB1Text(
                      controller.description,
                      color: SberColors.mainGray,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 64),
                    SizedBox(
                      width: 220,
                      child: SberPrimaryButtonLarge(
                        text: 'Вернуться на главную',
                        padding: EdgeInsets.zero,
                        onPressed: controller.backToMain,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
