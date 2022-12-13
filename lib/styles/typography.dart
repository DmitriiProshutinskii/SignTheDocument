import 'package:flutter/material.dart';
import 'package:sber_sign_test/styles/colors.dart';

abstract class _BaseText extends StatelessWidget {
  final String data;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final double? height;
  final double? letterSpacing;

  const _BaseText(
    this.data, {
    Key? key,
    required this.fontSize,
    required this.fontWeight,
    this.textAlign,
    this.color = SberColors.primaryBlack,
    this.maxLines,
    this.overflow,
    this.height,
    this.letterSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'SBSansDisplay',
        letterSpacing: letterSpacing,
      ),
      //height: height != null ? (height! / (fontSize ?? 14)) : null),
    );
  }
}

class SberH1Text extends _BaseText {
  const SberH1Text(
    String data, {
    Key? key,
    int maxLines = 1,
    Color color = SberColors.primaryBlack,
    TextAlign? textAlign,
  }) : super(data,
            key: key,
            maxLines: maxLines,
            fontSize: 48,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w700,
            color: color,
            textAlign: textAlign,
            height: 56);
}

class SberH2Text extends _BaseText {
  const SberH2Text(
    String data, {
    Key? key,
    int maxLines = 1,
    Color color = SberColors.primaryBlack,
    TextAlign? textAlign,
  }) : super(data,
            key: key,
            maxLines: maxLines,
            fontSize: 32,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w700,
            color: color,
            textAlign: textAlign,
            height: 40);
}

class SberH3Text extends _BaseText {
  const SberH3Text(
    String data, {
    Key? key,
    int maxLines = 1,
    Color color = SberColors.primaryBlack,
    TextAlign? textAlign,
  }) : super(
          data,
          key: key,
          maxLines: maxLines,
          fontSize: 24,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w600,
          color: color,
          textAlign: textAlign,
          height: 32,
          letterSpacing: 0,
        );
}

class SberH4Text extends _BaseText {
  const SberH4Text(
    String data, {
    Key? key,
    int maxLines = 1,
    Color color = SberColors.primaryBlack,
    TextAlign? textAlign,
  }) : super(data,
            key: key,
            maxLines: maxLines,
            fontSize: 18,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w600,
            color: color,
            textAlign: textAlign,
            height: 24);
}

class SberH5Text extends _BaseText {
  const SberH5Text(
    String data, {
    Key? key,
    int maxLines = 1,
    Color color = SberColors.primaryBlack,
    TextAlign? textAlign,
  }) : super(data,
            key: key,
            maxLines: maxLines,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w600,
            color: color,
            textAlign: textAlign,
            height: 24);
}

class SberH6Text extends _BaseText {
  const SberH6Text(
    String data, {
    Key? key,
    int maxLines = 1,
    Color color = SberColors.primaryBlack,
    TextAlign? textAlign,
  }) : super(data,
            key: key,
            maxLines: maxLines,
            fontSize: 14,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w600,
            color: color,
            textAlign: textAlign,
            height: 24);
}

class SberB1Text extends _BaseText {
  const SberB1Text(
    String data, {
    Key? key,
    int maxLines = 1,
    Color color = SberColors.primaryBlack,
    TextAlign? textAlign,
  }) : super(data,
            key: key,
            maxLines: maxLines,
            fontSize: 18,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w400,
            color: color,
            textAlign: textAlign,
            height: 32);
}

class SberB2Text extends _BaseText {
  const SberB2Text(
    String data, {
    Key? key,
    int maxLines = 1,
    Color color = SberColors.primaryBlack,
    TextAlign? textAlign,
  }) : super(data,
            key: key,
            maxLines: maxLines,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w400,
            color: color,
            textAlign: textAlign,
            height: 24);
}

class SberB3Text extends _BaseText {
  const SberB3Text(
    String data, {
    Key? key,
    int maxLines = 1,
    Color color = SberColors.primaryBlack,
    TextAlign? textAlign,
  }) : super(
          data,
          key: key,
          maxLines: maxLines,
          fontSize: 14,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w400,
          color: color,
          textAlign: textAlign,
          height: 24,
          letterSpacing: 0.25,
        );
}

class SberB4Text extends _BaseText {
  const SberB4Text(
    String data, {
    Key? key,
    int maxLines = 1,
    Color color = SberColors.primaryBlack,
    TextAlign? textAlign,
  }) : super(data,
            key: key,
            maxLines: maxLines,
            fontSize: 12,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w400,
            color: color,
            textAlign: textAlign,
            height: 16);
}

class SberB5Text extends _BaseText {
  const SberB5Text(
    String data, {
    Key? key,
    int maxLines = 1,
    Color color = SberColors.primaryBlack,
    TextAlign? textAlign,
  }) : super(data,
            key: key,
            maxLines: maxLines,
            fontSize: 10,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w400,
            color: color,
            textAlign: textAlign,
            height: 16);
}

class SberCText extends _BaseText {
  const SberCText(
    String data, {
    Key? key,
    int maxLines = 1,
    Color color = SberColors.primaryBlack,
    TextAlign? textAlign,
  }) : super(data,
            key: key,
            maxLines: maxLines,
            fontSize: 12,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w600,
            color: color,
            textAlign: textAlign,
            height: 16);
}

//

abstract class TextStyles {
  static const header6 = TextStyle(
    fontFamily: 'SBSansDisplay',
    fontSize: 14,
    color: SberColors.primaryBlack,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );

  static const header5 = TextStyle(
    fontFamily: 'SBSansDisplay',
    fontSize: 16,
    color: SberColors.primaryBlack,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );

  static const caption1 = TextStyle(
    fontFamily: 'SBSansDisplay',
    fontSize: 12,
    color: SberColors.primaryBlack,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.1,
  );
}
