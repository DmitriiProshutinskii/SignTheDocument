import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sber_sign_test/styles/colors.dart';
import 'package:sber_sign_test/styles/typography.dart';

class SberDocumentCellNormal extends StatelessWidget {
  const SberDocumentCellNormal({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: SberColors.primaryGaphitSber,
      strokeWidth: 1,
      radius: const Radius.circular(16),
      child: Row(
        children: const [
          Icon(Icons.download),
          SberB2Text('Кликните или перетащите \nдокумент в эту область.')
        ],
      ),
    );
  }
}
