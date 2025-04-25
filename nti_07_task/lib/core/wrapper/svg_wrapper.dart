import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class SvgWrappe extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final Widget? placeholder;

  const SvgWrappe({
    super.key,
    required this.assetName,
    this.width,
    this.height,
    this.fit,
    this.alignment,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      alignment: alignment ?? Alignment.center,
      placeholderBuilder:
          (context) => placeholder ?? const CupertinoActivityIndicator(),
    );
  }
}
