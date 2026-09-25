import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../controllers/splash_controller.dart';
import '../widgets/splash_continue_prompt.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  double _verticalOffset = 0;
  bool _isLeaving = false;

  SplashController get _controller => Get.find<SplashController>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _updateDrag(DragUpdateDetails details, double height) {
    if (_isLeaving) return;
    setState(() {
      _verticalOffset = (_verticalOffset + details.primaryDelta!)
          .clamp(-height, 0)
          .toDouble();
    });
  }

  Future<void> _animateTo(double target, double height) async {
    _animationController.duration = const Duration(milliseconds: 300);
    final animation = Tween<double>(begin: _verticalOffset, end: target)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );
    void update() {
      if (mounted) setState(() => _verticalOffset = animation.value);
    }

    animation.addListener(update);
    await _animationController.forward(from: 0);
    animation.removeListener(update);
  }

  Future<void> _finishSwipe(double height) async {
    if (_isLeaving) return;
    _isLeaving = true;
    await _animateTo(-height, height);
    if (mounted) _controller.continueToLogin();
  }

  Future<void> _endDrag(DragEndDetails details, double height) async {
    if (_isLeaving) return;
    final shouldContinue =
        _verticalOffset < -height * 0.18 ||
        (details.primaryVelocity ?? 0) < -500;
    if (shouldContinue) {
      await _finishSwipe(height);
    } else {
      await _animateTo(0, height);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onVerticalDragUpdate: (details) => _updateDrag(details, height),
        onVerticalDragEnd: (details) => _endDrag(details, height),
        onTap: () => _finishSwipe(height),
        child: Transform.translate(
          offset: Offset(0, _verticalOffset),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.primaryDark, AppColors.primary],
              ),
            ),
            child: SafeArea(
              child: Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 58),
                      child: Image.asset(AppAssets.logo, fit: BoxFit.contain),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 28,
                    child: SplashContinuePrompt(
                      onTap: () => _finishSwipe(height),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
