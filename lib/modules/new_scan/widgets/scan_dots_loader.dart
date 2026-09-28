import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

/// Ring of outlined dots that rotates, used while the report is generated.
class ScanDotsLoader extends StatefulWidget {
  final double size;

  const ScanDotsLoader({this.size = 56, super.key});

  @override
  State<ScanDotsLoader> createState() => _ScanDotsLoaderState();
}

class _ScanDotsLoaderState extends State<ScanDotsLoader>
    with SingleTickerProviderStateMixin {
  static const _dotCount = 8;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final radius = widget.size / 2;
    return RotationTransition(
      turns: _controller,
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: Stack(
          children: [
            for (var i = 0; i < _dotCount; i++)
              _dot(i, radius, i.isEven ? 12.0 : 8.0),
          ],
        ),
      ),
    );
  }

  Widget _dot(int index, double radius, double dotSize) {
    final angle = 2 * math.pi * index / _dotCount - math.pi / 2;
    final center = radius - dotSize / 2;
    return Positioned(
      left: center + (radius - 6) * math.cos(angle),
      top: center + (radius - 6) * math.sin(angle),
      child: Container(
        width: dotSize,
        height: dotSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.white, width: 1.2),
        ),
      ),
    );
  }
}
