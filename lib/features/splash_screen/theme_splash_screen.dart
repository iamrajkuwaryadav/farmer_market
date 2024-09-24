import 'dart:async';

import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  void navigator() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const OnBoardingScreen(),
        transitionDuration: const Duration(milliseconds: 2000),
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return Opacity(
            opacity: animation.value,
            child: child,
          );
        },
      ),
    );
  }

  /// Set timer splash
  _timer() async {
    return Timer(const Duration(milliseconds: 2300), navigator);
  }

  @override
  void initState() {
    super.initState();
    _timer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            top: 60,
            bottom: 60,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              CustomImageView(
                svgPath: LocalFiles.crunchShopIcon,
                height: getVerticalSize(155),
                width: getHorizontalSize(139),
              ),
              Padding(
                  padding: getPadding(top: 42),
                  child: const SlidingTextAnimation()),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class SlidingTextAnimation extends StatefulWidget {
  const SlidingTextAnimation({super.key});

  @override
  State<SlidingTextAnimation> createState() => _SlidingTextAnimationState();
}

class _SlidingTextAnimationState extends State<SlidingTextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _crunchAnimation;
  late Animation<Offset> _shopAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _crunchAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.5, curve: Curves.easeInOut),
      ),
    );

    _shopAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideTransition(
          position: _crunchAnimation,
          child: Text(
            "Crunch",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 38,
                  color: AppTheme.primaryColor,
                  fontFamily: 'Be Vietnam Pro',
                ),
          ),
        ),
        SlideTransition(
          position: _shopAnimation,
          child: Text(
            "Shop",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 38,
                  color: AppTheme.primaryTextColor,
                  fontFamily: 'Be Vietnam Pro',
                ),
          ),
        ),
      ],
    );
  }
}
