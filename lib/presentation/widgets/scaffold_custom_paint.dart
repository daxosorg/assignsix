import 'package:assignsix/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class ScaffoldCustomPaint extends StatelessWidget {
  const ScaffoldCustomPaint({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: GradientPainter());
  }
}

class GradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint greenPaint = Paint()
      ..shader = RadialGradient(
        colors: [const Color(0xff182C29).withOpacity(.5), kScaffoldMiddleColor],
        stops: const [0.0, 1],
        radius: 1.0,
      ).createShader(
        Rect.fromCircle(center: Offset(size.width, 0), radius: size.width * .5),
      );

    final Paint bluePaint = Paint()
      ..shader = RadialGradient(
        colors: [const Color(0xff191924).withOpacity(.5), kScaffoldMiddleColor],
        stops: const [0.0, 1],
        radius: 1.0,
      ).createShader(
        Rect.fromCircle(center: Offset(0, size.height), radius: size.width * .5),
      );

    final Paint middlePaint = Paint()..color = kScaffoldMiddleColor;
    canvas.drawRect(Offset.zero & size, middlePaint);

    canvas.drawCircle(Offset(size.width, 0), size.width, greenPaint);

    canvas.drawCircle(Offset(0, size.height), size.width, bluePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
