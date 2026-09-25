import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class BodyImageLabel {
  final String title;

  /// Fraction of the image height where the title's bottom edge sits.
  final double y;

  const BodyImageLabel(this.title, this.y);
}

/// Full-width body image with joint titles (and optional guide lines)
/// drawn over it. The scores themselves are part of the image asset.
class LabelledBodyImage extends StatelessWidget {
  final String asset;
  final double aspectRatio;
  final List<BodyImageLabel> labels;
  final bool showGuideLines;
  final bool mirrorLabels;

  const LabelledBodyImage({
    required this.asset,
    required this.aspectRatio,
    required this.labels,
    this.showGuideLines = false,
    this.mirrorLabels = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final width = constraints.maxWidth;
      final height = width / aspectRatio;
      return SizedBox(
        width: width,
        height: height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(child: Image.asset(asset, fit: BoxFit.fill)),
            for (final label in labels) ...[
              if (showGuideLines)
                Positioned(
                  top: height * label.y,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 0.6,
                    color: AppColors.white.withValues(alpha: 0.35),
                  ),
                ),
              Positioned(
                top: height * label.y,
                left: 0,
                child: _Title(label.title),
              ),
              if (mirrorLabels)
                Positioned(
                  top: height * label.y,
                  right: 0,
                  child: _Title(label.title),
                ),
            ],
          ],
        ),
      );
    },
  );
}

class _Title extends StatelessWidget {
  final String text;

  const _Title(this.text);

  @override
  Widget build(BuildContext context) => FractionalTranslation(
    translation: const Offset(0, -1),
    child: Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Text(
        text,
        style: AppTextStyles.caption.copyWith(
          fontSize: 10,
          color: AppColors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}
