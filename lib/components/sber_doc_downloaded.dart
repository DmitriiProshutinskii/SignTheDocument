import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sber_sign_test/components/sber_icons.dart';
import 'package:sber_sign_test/styles/colors.dart';
import 'package:sber_sign_test/styles/typography.dart';

class SberDocDownloadedMd extends StatelessWidget {
  final String title;
  final SberIcon icon;
  const SberDocDownloadedMd(
      {super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    String formattedDate = DateFormat('dd.MM.yyyy').format(date);
    return Container(
      width: 272,
      decoration: BoxDecoration(
        border: Border.all(color: SberColors.formBorder),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          // const Icon(Icons.file_present,
          //     color: SberColors.electricBlue4, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SberB2Text(title),
                SberB3Text(formattedDate, color: SberColors.mainGray)
              ],
            ),
          )
        ],
      ),
    );
  }
}
