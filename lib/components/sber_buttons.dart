import 'package:flutter/material.dart';
import 'package:sber_sign_test/components/sber_button_styles.dart';
import 'package:sber_sign_test/components/sber_icons.dart';
import 'package:sber_sign_test/styles/colors.dart';

class _BaseButton extends StatefulWidget {
  final String text;
  final SberIcon? leadingIcon;
  final IconData? trailingIcon;
  final bool isEnabled;
  final bool addShadow;

  final Future<void> Function()? onPressed;

  final Widget? isProgressWidget;

  final EdgeInsets padding;
  final EdgeInsets? margin;

  const _BaseButton({
    Key? key,
    required this.text,
    required this.isEnabled,
    required this.isProgressWidget,
    this.addShadow = false,
    this.leadingIcon,
    this.trailingIcon,
    required this.onPressed,
    this.padding = const EdgeInsets.fromLTRB(0, 8, 0, 16),
    this.margin,
  }) : super(key: key);

  @override
  State<_BaseButton> createState() => _BaseButtonState();

  getStyle() {}
}

class _BaseButtonState extends State<_BaseButton> {
  bool _inProgress = false;

  GlobalKey stickyKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BuildContext? keyContext = stickyKey.currentContext;

    final double? height = (keyContext != null)
        ? (keyContext.findRenderObject() as RenderBox?)?.size.height
        : null;

    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: (_inProgress && widget.isProgressWidget != null)
            ? Padding(
                padding: widget.padding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      key: const ValueKey(1),
                      height: height,
                      child: widget.isProgressWidget!,
                    ),
                  ],
                ),
              )
            : Container(
                key: const ValueKey(2),
                child: Padding(
                  padding: widget.padding,
                  child: TextButton(
                    // key: stickyKey,
                    onPressed: () async {
                      if (widget.isEnabled && !_inProgress) {
                        setState(() {
                          _inProgress = true;
                        });
                        try {
                          if (widget.onPressed != null) {
                            await widget.onPressed!();
                          }
                        } finally {
                          _inProgress = false;
                          if (mounted) {
                            setState(() {});
                          }
                        }
                      }
                    },
                    style: widget.getStyle(),

                    child: Padding(
                      padding: widget.margin ??
                          const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (widget.leadingIcon != null) ...[
                            widget.leadingIcon!,
                            const SizedBox(width: 8),
                          ],
                          Text(widget.text),
                          if (widget.trailingIcon != null) ...[
                            const SizedBox(width: 8),
                            Icon(widget.trailingIcon, size: 18),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ));
  }
}

class _LoadingProgress extends StatelessWidget {
  final Color? backgroundColor;
  const _LoadingProgress({Key? key, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 32,
      width: 32,
      child: CircularProgressIndicator(
        backgroundColor: SberColors.lightGray,
        color: SberColors.electricBlue75,
        strokeWidth: 2,
      ),
    );
  }
}

class SberPrimaryButtonSm extends _BaseButton {
  const SberPrimaryButtonSm(
      {Key? key,
      required String text,
      bool isEnabled = true,
      bool addShadow = false,
      SberIcon? leadingIcon,
      IconData? trailingIcon,
      EdgeInsets padding = const EdgeInsets.fromLTRB(16, 8, 16, 12),
      EdgeInsets? margin,
      required Future<void> Function()? onPressed})
      : super(
            key: key,
            isEnabled: isEnabled,
            onPressed: onPressed,
            text: text,
            addShadow: addShadow,
            leadingIcon: leadingIcon,
            isProgressWidget: const _LoadingProgress(
              backgroundColor: SberColors.electricBlue4,
            ),
            padding: padding,
            margin: margin,
            trailingIcon: trailingIcon);

  @override
  ButtonStyle getStyle() {
    return SberButtonStyles.primaryStyleSm(isEnabled);
  }
}

class SberSecondaryButtonSm extends _BaseButton {
  const SberSecondaryButtonSm(
      {Key? key,
      required String text,
      bool isEnabled = true,
      bool addShadow = false,
      EdgeInsets padding = const EdgeInsets.fromLTRB(16, 8, 16, 12),
      EdgeInsets? margin,
      SberIcon? leadingIcon,
      IconData? trailingIcon,
      required Future<void> Function()? onPressed})
      : super(
            key: key,
            isEnabled: isEnabled,
            onPressed: onPressed,
            text: text,
            addShadow: addShadow,
            padding: padding,
            margin: margin,
            isProgressWidget: const _LoadingProgress(),
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon);

  @override
  ButtonStyle getStyle() {
    return SberButtonStyles.getSecondaryStyleSm(isEnabled);
  }
}

// Large
class SberPrimaryButtonLarge extends _BaseButton {
  const SberPrimaryButtonLarge(
      {Key? key,
      required String text,
      bool isEnabled = true,
      bool addShadow = false,
      SberIcon? leadingIcon,
      IconData? trailingIcon,
      EdgeInsets padding = const EdgeInsets.fromLTRB(16, 8, 16, 16),
      EdgeInsets margin = const EdgeInsets.symmetric(vertical: 12),
      required Future<void> Function()? onPressed})
      : super(
            key: key,
            isEnabled: isEnabled,
            onPressed: onPressed,
            text: text,
            addShadow: addShadow,
            leadingIcon: leadingIcon,
            isProgressWidget: const _LoadingProgress(
              backgroundColor: SberColors.electricBlue4,
            ),
            padding: padding,
            margin: margin,
            trailingIcon: trailingIcon);

  @override
  ButtonStyle getStyle() {
    return SberButtonStyles.primaryStyleLarge(isEnabled);
  }
}
