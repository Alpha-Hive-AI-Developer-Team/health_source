import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class BodyScanFigure extends StatelessWidget {
  final bool sideView;

  const BodyScanFigure({required this.sideView, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 165,
    child: CustomPaint(
      painter: _BodyScanPainter(sideView: sideView),
      child: const SizedBox.expand(),
    ),
  );
}

class _BodyScanPainter extends CustomPainter {
  final bool sideView;

  const _BodyScanPainter({required this.sideView});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, 38);
    final figurePaint = Paint()
      ..color = const Color(0xFF8B8B8B)
      ..style = PaintingStyle.fill;
    final linePaint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    final pointPaint = Paint()
      ..color = AppColors.success
      ..style = PaintingStyle.fill;
    final offsetX = sideView ? 5.0 : 0.0;

    canvas.drawCircle(center.translate(offsetX, 0), 13, figurePaint);
    final body = Path()
      ..moveTo(center.dx - 12 + offsetX, center.dy + 12)
      ..quadraticBezierTo(
        center.dx - 22 + offsetX,
        center.dy + 35,
        center.dx - 13 + offsetX,
        center.dy + 67,
      )
      ..lineTo(center.dx - 8 + offsetX, center.dy + 91)
      ..lineTo(center.dx - 18 + offsetX, center.dy + 130)
      ..lineTo(center.dx - 10 + offsetX, center.dy + 132)
      ..lineTo(center.dx + offsetX, center.dy + 101)
      ..lineTo(center.dx + 10 + offsetX, center.dy + 132)
      ..lineTo(center.dx + 18 + offsetX, center.dy + 130)
      ..lineTo(center.dx + 8 + offsetX, center.dy + 91)
      ..lineTo(center.dx + 13 + offsetX, center.dy + 67)
      ..quadraticBezierTo(
        center.dx + 22 + offsetX,
        center.dy + 35,
        center.dx + 12 + offsetX,
        center.dy + 12,
      )
      ..close();
    canvas.drawPath(body, figurePaint);

    final spineX = center.dx + offsetX;
    canvas.drawLine(
      Offset(spineX, center.dy + 20),
      Offset(spineX, center.dy + 100),
      linePaint,
    );
    for (var index = 0; index < 6; index++) {
      final y = center.dy + 25 + index * 14;
      canvas.drawCircle(Offset(spineX - 30, y), 2.1, pointPaint);
      canvas.drawCircle(Offset(spineX + 30, y), 2.1, pointPaint);
      canvas.drawLine(
        Offset(spineX - 26, y),
        Offset(spineX - 12, y),
        linePaint,
      );
      canvas.drawLine(
        Offset(spineX + 12, y),
        Offset(spineX + 26, y),
        linePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _BodyScanPainter oldDelegate) =>
      oldDelegate.sideView != sideView;
}
