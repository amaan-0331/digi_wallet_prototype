import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// for implementing camera
// use https://medium.com/@fernnandoptr/how-to-use-camera-in-flutter-flutter-camera-package-44defe81d2da

class ProfileScanner extends StatelessWidget {
  const ProfileScanner({
    super.key,
    required this.height,
    required this.width,
    required this.animationStopped,
    required this.animationController,
  });

  final double width;
  final double height;
  final bool animationStopped;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DottedBorder(
        dashPattern: const [5, 5],
        strokeWidth: 3,
        color: AppColors.orange,
        borderType: BorderType.Circle,
        child: Stack(
          children: [
            SizedBox(
              width: width,
              height: height,
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/profile_scan.svg',
                  height: height / 3.5,
                  width: width / 3.5,
                ),
              ),
            ),
            ScannerAnimation(
              stopped: animationStopped,
              width: height,
              animation: animationController,
            ),
          ],
        ),
      ),
    );
  }
}

class ScannerAnimation extends AnimatedWidget {
  const ScannerAnimation({
    super.key,
    required this.stopped,
    required this.width,
    required Animation<double> animation,
  }) : super(
          listenable: animation,
        );
  final bool stopped;
  final double width;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    final scorePosition = animation.value * 440;

    var color1 = AppColors.purple.withOpacity(0.7);
    var color2 = Colors.transparent;

    if (animation.status == AnimationStatus.reverse) {
      color1 = Colors.transparent;
      color2 = AppColors.purple.withOpacity(0.7);
    }

    return Positioned(
      height: width / 2,
      width: width,
      bottom: scorePosition,
      child: Opacity(
        opacity: stopped ? 0.0 : 1.0,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0, 1],
              colors: [color1, color2],
            ),
          ),
        ),
      ),
    );
  }
}
