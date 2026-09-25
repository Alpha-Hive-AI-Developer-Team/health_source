import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class ExpandableScanFab extends StatefulWidget {
  final VoidCallback? onProfileTap;
  final VoidCallback? onSettingsTap;
  final VoidCallback? onScanTap;

  final IconData? profileIcon;
  final String? profileImage;
  final IconData? settingsIcon;
  final String? settingsImage;
  final IconData? scanIcon;
  final String? scanImage;

  const ExpandableScanFab({
    super.key,
    this.onProfileTap,
    this.onSettingsTap,
    this.onScanTap,
    this.profileIcon = Icons.person_outline,
    this.profileImage,
    this.settingsIcon = Icons.grid_view_rounded,
    this.settingsImage,
    this.scanIcon = Icons.grid_view_rounded,
    this.scanImage,
  });

  @override
  State<ExpandableScanFab> createState() => _ExpandableScanFabState();
}

class _ExpandableScanFabState extends State<ExpandableScanFab> {
  bool expanded = false;

  // ── Figma values (tweak here) ──────────────────────────
  static const double _blob =
      82; // the rounded blob square, top-left anchored at (0,0)
  static const double _radius =
      30; // large radius so the blob reads as a squircle, not a rounded square
  static const double _button = 56; // circle button diameter
  static const double _gap =
      4; // dark ring thickness visible between blob edge and button

  // Button is centered exactly on the blob's bottom-right corner, so most
  // of it overlaps OUTSIDE the blob — matching the Figma reference.
  static const Offset _buttonCenter = Offset(_blob, _blob);

  // Total stack bounds must fit the button's overflow past the blob.
  static const double _container = _blob + _button / 2;

  @override
  Widget build(BuildContext context) {
    if (!expanded) {
      return _CircleButton(
        icon: widget.scanIcon,
        imagePath: widget.scanImage,
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
          Positioned(
            top: 0,
            left: 0,
            child: ClipPath(
              clipper: _BlobClipper(
                radius: _radius,
                cutCenter: _buttonCenter,
                cutRadius: _button / 2 + _gap,
              ),
              child: Container(
                width: _blob,
                height: _blob,
                color: AppColors.primary,
              ),
            ),
          ),

          Positioned(
            top: 14,
            left: 12,
            child: _IconOnly(
              icon: widget.profileIcon,
              imagePath: widget.profileImage,
              onTap: widget.onProfileTap ?? () {},
            ),
          ),

          Positioned(
            top: 8,
            left: 44,
            child: _IconOnly(
              icon: widget.settingsIcon,
              imagePath: widget.settingsImage,
              size: 16,
              onTap: widget.onSettingsTap ?? () {},
            ),
          ),

          Positioned(
            top: 48,
            left: 12,
            child: _IconOnly(
              icon: Icons.close,
              onTap: () => setState(() => expanded = false),
            ),
          ),

          // Button is drawn centered on the blob's corner, overlapping outside it.
          Positioned(
            left: _buttonCenter.dx - _button / 2,
            top: _buttonCenter.dy - _button / 2,
            child: _CircleButton(
              icon: widget.scanIcon,
              imagePath: widget.scanImage,
              size: _button,
              onTap: widget.onScanTap ?? () {},
            ),
          ),
        ],
      ),
    );
  }
}

/// Rounded square (squircle-like, uniform radius) minus a circle at its
/// corner — the cut sits exactly where the button overlaps, leaving only
/// a thin crescent gap visible, matching the reference.
class _BlobClipper extends CustomClipper<Path> {
  final double radius;
  final Offset cutCenter;
  final double cutRadius;

  const _BlobClipper({
    required this.radius,
    required this.cutCenter,
    required this.cutRadius,
  });

  @override
  Path getClip(Size size) {
    final blob = Path()
      ..addRRect(
        RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(radius)),
      );

    final cut = Path()
      ..addOval(Rect.fromCircle(center: cutCenter, radius: cutRadius));

    return Path.combine(PathOperation.difference, blob, cut);
  }

  @override
  bool shouldReclip(covariant _BlobClipper old) =>
      old.radius != radius ||
      old.cutCenter != cutCenter ||
      old.cutRadius != cutRadius;
}

class _IconOrImage extends StatelessWidget {
  final IconData? icon;
  final String? imagePath;
  final double size;
  final Color color;

  const _IconOrImage({
    this.icon,
    this.imagePath,
    required this.size,
    this.color = AppColors.white,
  }) : assert(
         icon != null || imagePath != null,
         'Provide either an icon or an imagePath',
       );

  @override
  Widget build(BuildContext context) {
    if (imagePath != null) {
      return ClipOval(
        child: Image.asset(
          imagePath!,
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      );
    }
    return Icon(icon, size: size, color: color);
  }
}

class _CircleButton extends StatelessWidget {
  final IconData? icon;
  final String? imagePath;
  final VoidCallback onTap;
  final double size;

  const _CircleButton({
    this.icon,
    this.imagePath,
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
          child: Center(
            child: _IconOrImage(icon: icon, imagePath: imagePath, size: 24),
          ),
        ),
      ),
    );
  }
}

class _IconOnly extends StatelessWidget {
  final IconData? icon;
  final String? imagePath;
  final VoidCallback onTap;
  final double size;

  const _IconOnly({
    this.icon,
    this.imagePath,
    required this.onTap,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      radius: 20,
      child: SizedBox(
        width: 28,
        height: 28,
        child: Center(
          child: _IconOrImage(icon: icon, imagePath: imagePath, size: size),
        ),
      ),
    );
  }
}
