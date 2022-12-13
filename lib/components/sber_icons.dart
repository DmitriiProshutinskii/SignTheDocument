import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sber_sign_test/styles/colors.dart';

class SberIcon extends StatelessWidget {
  final String path;
  final Color? color;
  final double? size;
  const SberIcon({super.key, required this.path, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      color: color ?? SberColors.primaryBlack,
      width: size ?? 40,
      height: size ?? 40,
    );
  }
}

class SberIconDocDownloaded extends SberIcon {
  const SberIconDocDownloaded({Color? color, double? size, super.key})
      : super(
            path: 'assets/svg_icons/ic_doc_downloaded.svg',
            color: color,
            size: size);
}

class SberIconDocSignedOne extends SberIcon {
  const SberIconDocSignedOne({Color? color, double? size, super.key})
      : super(
            path: 'assets/svg_icons/ic_doc_signed_1.svg',
            color: color,
            size: size);
}

class SberIconDownloadSm extends SberIcon {
  const SberIconDownloadSm({Color? color, double? size, super.key})
      : super(
            path: 'assets/svg_icons/ic_download.svg',
            color: color,
            size: size ?? 15);
}
