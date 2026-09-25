import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class _ScanMarker {
  final String value;
  final Color color;
  final double y; // fraction of figure height

  const _ScanMarker(this.value, this.color, this.y);
}

class BodyScanFigure extends StatelessWidget {
  final bool sideView;

  const BodyScanFigure({required this.sideView, super.key});

  static const _left = [
    _ScanMarker('80', Color(0xFFE91E8C), 0.10),
    _ScanMarker('85', Color(0xFF6C63FF), 0.16),
    _ScanMarker('90', Color(0xFF2E3A8C), 0.22),
    _ScanMarker('80', Color(0xFFE91E8C), 0.42),
    _ScanMarker('80', Color(0xFF3A3A3A), 0.50),
    _ScanMarker('40', Color(0xFFE53935), 0.58),
    _ScanMarker('80', Color(0xFFE91E8C), 0.72),
    _ScanMarker('80', Color(0xFF2E3A8C), 0.80),
    _ScanMarker('60', Color(0xFF43A047), 0.88),
    _ScanMarker('30', Color(0xFFFFC107), 0.95),
  ];

  static const _right = [
    _ScanMarker('80', Color(0xFFE91E8C), 0.10),
    _ScanMarker('85', Color(0xFF6C63FF), 0.16),
    _ScanMarker('90', Color(0xFF2E3A8C), 0.22),
    _ScanMarker('80', Color(0xFFE91E8C), 0.42),
    _ScanMarker('80', Color(0xFF3A3A3A), 0.50),
    _ScanMarker('40', Color(0xFFE53935), 0.58),
    _ScanMarker('80', Color(0xFFE91E8C), 0.72),
    _ScanMarker('80', Color(0xFF2E3A8C), 0.80),
    _ScanMarker('60', Color(0xFF43A047), 0.88),
    _ScanMarker('30', Color(0xFFFFC107), 0.95),
  ];

  static const double _figureHeight = 320;
  static const double _figureWidth = 300;
  static const double _bodyVisualWidth = 90;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: _figureHeight,
    width: _figureWidth,
    child: Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: const Size(_figureWidth, _figureHeight),
          painter: _LinePainter(left: _left, right: _right),
        ),
        Image.asset(
          sideView ? AppAssets.human1 : AppAssets.human1,
          height: _figureHeight * 0.85,
          fit: BoxFit.contain,
        ),
        for (final m in _left)
          Positioned(
            left: 0,
            top: _figureHeight * m.y - 6,
            child: _Label(marker: m, leftSide: true),
          ),
        for (final m in _right)
          Positioned(
            right: 0,
            top: _figureHeight * m.y - 6,
            child: _Label(marker: m, leftSide: false),
          ),
      ],
    ),
  );
}

class _Label extends StatelessWidget {
  final _ScanMarker marker;
  final bool leftSide;

  const _Label({required this.marker, required this.leftSide});

  @override
  Widget build(BuildContext context) {
    final text = Text(
      marker.value,
      style: AppTextStyles.caption.copyWith(
        fontSize: 11,
        color: AppColors.white,
      ),
    );
    final dot = Container(
      width: 7,
      height: 7,
      decoration: BoxDecoration(color: marker.color, shape: BoxShape.circle),
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: leftSide
          ? [text, const SizedBox(width: 4), dot]
          : [dot, const SizedBox(width: 4), text],
    );
  }
}

class _LinePainter extends CustomPainter {
  final List<_ScanMarker> left;
  final List<_ScanMarker> right;

  const _LinePainter({required this.left, required this.right});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white24
      ..strokeWidth = 0.8
      ..style = PaintingStyle.stroke;

    final centerX = size.width / 2;
    final bodyLeft = centerX - BodyScanFigure._bodyVisualWidth / 2;
    final bodyRight = centerX + BodyScanFigure._bodyVisualWidth / 2;

    for (final m in left) {
      final y = size.height * m.y;
      canvas.drawLine(Offset(34, y), Offset(bodyLeft + 10, y), paint);
    }
    for (final m in right) {
      final y = size.height * m.y;
      canvas.drawLine(
        Offset(bodyRight - 10, y),
        Offset(size.width - 34, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _LinePainter oldDelegate) => false;
}
