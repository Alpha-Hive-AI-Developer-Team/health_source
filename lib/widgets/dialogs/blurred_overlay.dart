import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredOverlay extends StatelessWidget {
  final Widget child;
  final Alignment alignment;

  const BlurredOverlay({
    super.key,
    required this.child,
    this.alignment = Alignment.bottomCenter,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(color: Colors.black.withOpacity(.52)),
            ),
          ),
          Align(alignment: alignment, child: child),
        ],
      ),
    );
  }
}
