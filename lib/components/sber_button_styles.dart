import 'package:flutter/material.dart';
import 'package:sber_sign_test/styles/colors.dart';
import 'package:sber_sign_test/styles/typography.dart';

class SberButtonStyles {
  static ButtonStyle notEnableStyleSm = ElevatedButton.styleFrom(
    padding: EdgeInsets.zero,
    backgroundColor: SberColors.lightGray,
    foregroundColor: SberColors.coolGray,
    minimumSize: const Size(90, 44),
    textStyle: TextStyles.header6.copyWith(color: SberColors.coolGray),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24))),
  );
  static ButtonStyle notEnableStyleLarge = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(SberColors.coolGray),
    backgroundColor: MaterialStateProperty.all(SberColors.lightGray),
    overlayColor: MaterialStateProperty.all(SberColors.transparent),
    padding: MaterialStateProperty.all(EdgeInsets.zero),
    minimumSize: MaterialStateProperty.all(const Size(400, 48)),
    textStyle: MaterialStateProperty.all(TextStyles.header5),
    elevation: MaterialStateProperty.all(0),
    shape: MaterialStateProperty.all(const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)))),
  );

  static ButtonStyle Function(bool isEnabled) get primaryStyleSm {
    return (isEnabled) {
      if (isEnabled) {
        return ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: SberColors.electricBlue4,
          foregroundColor: SberColors.primaryWhite,
          disabledBackgroundColor: SberColors.primaryBlack,
          minimumSize: const Size(90, 44),
          textStyle:
              TextStyles.header6.copyWith(color: SberColors.primaryWhite),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24))),
        );
      } else {
        return notEnableStyleSm;
      }
    };
  }

  static ButtonStyle Function(bool isEnabled) get getSecondaryStyleSm {
    return (isEnabled) {
      if (isEnabled) {
        return ElevatedButton.styleFrom(
          foregroundColor: SberColors.electricBlue75,
          padding: EdgeInsets.zero,
          backgroundColor: SberColors.lightGray,
          minimumSize: const Size(90, 44),
          textStyle:
              TextStyles.header6.copyWith(color: SberColors.electricBlue75),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24))),
        );
      } else {
        return notEnableStyleSm;
      }
    };
  }

  static ButtonStyle Function(bool isEnabled) get primaryStyleLarge {
    return (isEnabled) {
      if (isEnabled) {
        return ButtonStyle(
          foregroundColor: MaterialStateProperty.all(SberColors.primaryWhite),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return SberColors.electricBlue75;
              }
              return SberColors.electricBlue4;
            },
          ),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          minimumSize: MaterialStateProperty.all(const Size(400, 48)),
          textStyle: MaterialStateProperty.all(TextStyles.header5),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24)))),
        );
      } else {
        return notEnableStyleLarge;
      }
    };
  }
}
