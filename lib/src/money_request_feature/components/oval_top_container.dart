import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';

class OvalTopContainer extends StatelessWidget {
  const OvalTopContainer({
    super.key,
    required this.height,
    required this.width,
    required this.child,
  });
  final double width;
  final double height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomPaint(
          painter:
              ShapesPainter(backgroundColor: AppColors.orange.withOpacity(0.7)),
          child: SizedBox(
            height: height + 15,
            width: width,
          ),
        ),
        CustomPaint(
          painter: ShapesPainter(backgroundColor: AppColors.orange),
          child: SizedBox(
            height: height,
            width: width,
            child: child,
          ),
        ),
      ],
    );
  }
}

// custom clipper
class ShapesPainter extends CustomPainter {
  ShapesPainter({required this.backgroundColor});
  final Color backgroundColor;
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..lineTo(0, 0)
      ..lineTo(0, 40)
      ..quadraticBezierTo(size.width / 4, 0, size.width / 2, 0)
      ..quadraticBezierTo(size.width - size.width / 4, 0, size.width, 40)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    canvas.drawPath(path, Paint()..color = backgroundColor);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
