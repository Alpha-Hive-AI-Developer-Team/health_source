import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class ExpandableScanFab extends StatefulWidget {
  final VoidCallback? onProfileTap;
  final VoidCallback? onSettingsTap;
  final VoidCallback? onScanTap;

  const ExpandableScanFab({
    super.key,
    this.onProfileTap,
    this.onSettingsTap,
    this.onScanTap,
  });

  @override
  State<ExpandableScanFab> createState() => _ExpandableScanFabState();
}

class _ExpandableScanFabState extends State<ExpandableScanFab> {
  bool expanded = false;

  // ── Figma values (tweak here) ──────────────────────────
  static const double _container = 110; // full 110 x 110 frame
  static const double _blob = 88; // blob size inside the frame
  static const double _button = 48; // circle button diameter
  static const double _gap = 6; // dark gap between blob and button
  static const double _rSmall = 27.62; // Figma corner radius
  static const double _rTopRight = 44; // rounder top-right corner

  @override
  Widget build(BuildContext context) {
    if (!expanded) {
      return _CircleButton(
        icon: Icons.grid_view_outlined,
        size: _button,
        onTap: () => setState(() => expanded = true),
      );
    }

    return SizedBox(
      width: _container,
      height: _container,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Blob with the circular scoop cut out of the bottom-right
          Positioned(
            top: 0,
            left: 0,
            child: ClipPath(
              clipper: _BlobClipper(
                topLeft: _rSmall,
                topRight: _rTopRight,
                bottomLeft: _rSmall,
                bottomRight: _rSmall,
                cutCenter: const Offset(
                  _container - _button / 2,
                  _container - _button / 2,
                ),
                cutRadius: _button / 2 + _gap,
              ),
              child: Container(
                width: _blob,
                height: _blob,
                color: AppColors.primary,
              ),
            ),
          ),

          // Person (top-left)
          Positioned(
            top: 18,
            left: 14,
            child: _IconOnly(
              icon: Icons.person_outline,
              onTap: widget.onProfileTap ?? () {},
            ),
          ),

          // Settings (hexagon, top, a bit higher than person)
          Positioned(
            top: 10,
            left: 50,
            child: _IconOnly(
              icon: Icons.hexagon_outlined,
              size: 18,
              onTap: widget.onSettingsTap ?? () {},
            ),
          ),

          // Close (bottom-left)
          Positioned(
            top: 56,
            left: 14,
            child: _IconOnly(
              icon: Icons.close,
              onTap: () => setState(() => expanded = false),
            ),
          ),

          // Circle button, bottom-right
          Positioned(
            right: 0,
            bottom: 0,
            child: _CircleButton(
              icon: Icons.grid_view_outlined,
              size: _button,
              onTap: widget.onScanTap ?? () {},
            ),
          ),
        ],
      ),
    );
  }
}

/// Rounded rect with different corner radii, minus a circle.
/// [cutCenter] is in the same coordinate space as the clip (top-left origin).
class _BlobClipper extends CustomClipper<Path> {
  final double topLeft, topRight, bottomLeft, bottomRight;
  final Offset cutCenter;
  final double cutRadius;

  const _BlobClipper({
    required this.topLeft,
    required this.topRight,
    required this.bottomLeft,
    required this.bottomRight,
    required this.cutCenter,
    required this.cutRadius,
  });

  @override
  Path getClip(Size size) {
    final blob = Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          Offset.zero & size,
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight),
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight),
        ),
      );

    final cut = Path()
      ..addOval(Rect.fromCircle(center: cutCenter, radius: cutRadius));

    return Path.combine(PathOperation.difference, blob, cut);
  }

  @override
  bool shouldReclip(covariant _BlobClipper old) =>
      old.topLeft != topLeft ||
      old.topRight != topRight ||
      old.bottomLeft != bottomLeft ||
      old.bottomRight != bottomRight ||
      old.cutCenter != cutCenter ||
      old.cutRadius != cutRadius;
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double size;

  const _CircleButton({
    required this.icon,
    required this.onTap,
    this.size = 48,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: size,
          height: size,
          child: Icon(icon, size: 24, color: AppColors.white),
        ),
      ),
    );
  }
}

class _IconOnly extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double size;

  const _IconOnly({required this.icon, required this.onTap, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      radius: 20,
      child: SizedBox(
        width: 28,
        height: 28,
        child: Icon(icon, size: size, color: AppColors.white),
      ),
    );
  }
}
