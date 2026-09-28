import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

/// Viewfinder area with white corner brackets. The camera preview goes in
/// [child]; until then a plain surface is shown.
class ScanCameraFrame extends StatelessWidget {
  final Widget? child;

  const ScanCameraFrame({this.child, super.key});

  static const _bracketLength = 22.0;
  static const _bracketWidth = 3.0;
  static const _inset = 4.0;

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Positioned.fill(
        child: Padding(
          padding: const EdgeInsets.all(_inset),
          child: ColoredBox(color: AppColors.surface, child: child),
        ),
      ),
      for (final alignment in const [
        Alignment.topLeft,
        Alignment.topRight,
        Alignment.bottomLeft,
        Alignment.bottomRight,
      ])
        Align(alignment: alignment, child: _Bracket(alignment)),
    ],
  );
}

class _Bracket extends StatelessWidget {
  final Alignment alignment;

  const _Bracket(this.alignment);

  @override
  Widget build(BuildContext context) {
    const side = BorderSide(
      color: AppColors.white,
      width: ScanCameraFrame._bracketWidth,
    );
    return SizedBox(
      width: ScanCameraFrame._bracketLength,
      height: ScanCameraFrame._bracketLength,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            top: alignment.y < 0 ? side : BorderSide.none,
            bottom: alignment.y > 0 ? side : BorderSide.none,
            left: alignment.x < 0 ? side : BorderSide.none,
            right: alignment.x > 0 ? side : BorderSide.none,
          ),
        ),
      ),
    );
  }
}
