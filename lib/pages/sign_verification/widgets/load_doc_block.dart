import 'package:flutter/material.dart';
import 'package:sber_sign_test/components/sber_buttons.dart';
import 'package:sber_sign_test/components/sber_counter.dart';
import 'package:sber_sign_test/components/sber_doc_downloaded.dart';
import 'package:sber_sign_test/components/sber_icons.dart';
import 'package:sber_sign_test/styles/typography.dart';

class LoadDocWidget extends StatelessWidget {
  final int index;
  final SberCounterState state;
  final Future Function() onPressed;
  final String title;
  final String description;
  final String buttonText;
  final IconData buttonIcon;
  final SberIcon docIcon;
  final String? docTitle;
  const LoadDocWidget(
      {super.key,
      required this.index,
      required this.state,
      required this.onPressed,
      required this.title,
      required this.description,
      required this.buttonText,
      required this.buttonIcon,
      this.docTitle,
      required this.docIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 440,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SberCounter(state: state, digit: index),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SberH5Text(title),
              const SizedBox(height: 8),
              SberB3Text(description),
              const SizedBox(height: 16),
              docTitle != null
                  ? SberDocDownloadedMd(
                      title: docTitle ?? 'Doument', icon: docIcon)
                  : SberSecondaryButtonSm(
                      padding: EdgeInsets.zero,
                      leadingIcon: buttonIcon,
                      text: buttonText,
                      onPressed: onPressed,
                    ),
            ],
          )
        ],
      ),
    );
  }
}
