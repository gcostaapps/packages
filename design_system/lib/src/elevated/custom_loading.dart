// ignore_for_file: library_private_types_in_public_api

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../design_system.dart';

class CustomLoading extends StatefulWidget {
  const CustomLoading({
    super.key,
    this.spinChild,
    this.text,
    this.cancelable = false,
  });

  final Widget? spinChild;
  final String? text;
  final bool cancelable;

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<CustomLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pouringAnimation;
  late Animation<double> _rotationAnimation;

  final double size = 48;
  final double strokeWidth = 1.5;
  final Duration duration = const Duration(milliseconds: 2000);

  @override
  void initState() {
    super.initState();

    if (widget.spinChild == null) {
      _controller = (AnimationController(vsync: this, duration: duration))
        ..addListener(() => setState(() => {}))
        ..repeat();
      _pouringAnimation =
          CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.9))
            ..addListener(() => setState(() => {}));
      _rotationAnimation = Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.9, 1.0, curve: Curves.easeInOut)));
    }
  }

  @override
  void dispose() {
    if (widget.spinChild == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.cancelable,
      onPopInvoked: onPopInvoked,
      child: Container(
        color: AppBaseColors.darkSurfaceColors,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.spinChild ??
                  RotationTransition(
                    turns: _rotationAnimation,
                    child: SizedBox.fromSize(
                      size: Size.square(size * math.sqrt1_2),
                      child: CustomPaint(
                        painter: _HourGlassPaint(
                          poured: _pouringAnimation.value,
                          color: AppBaseColors.offWhite,
                          strokeWidth: strokeWidth,
                        ),
                      ),
                    ),
                  ),
              if (widget.text != null) ...[
                SpacerHeight16,
                Text(
                  widget.text!,
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: AppBaseColors.offWhite,
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onPopInvoked(bool didPop) async {
    {
      if (didPop) {
        context.loaderOverlay.hide();
      }
    }
  }
}

class _HourGlassPaint extends CustomPainter {
  _HourGlassPaint({this.strokeWidth, this.poured, required Color color})
      : _paint = Paint()
          ..style = PaintingStyle.stroke
          ..color = color,
        _powderPaint = Paint()
          ..style = PaintingStyle.fill
          ..color = color;

  final double? strokeWidth;
  final double? poured;
  final Paint _paint;
  final Paint _powderPaint;

  @override
  // ignore: long-method
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final halfHeight = size.height / 2;
    final hourglassWidth = math.min(centerX * 0.8, halfHeight);
    final gapWidth = math.max(3.0, hourglassWidth * 0.05);
    final yPadding = gapWidth / 2;
    final top = yPadding;
    final bottom = size.height - yPadding;
    _paint.strokeWidth = strokeWidth ?? gapWidth;

    final hourglassPath = Path()
      ..moveTo(centerX - hourglassWidth + 2, top)
      ..lineTo(centerX + hourglassWidth, top)
      ..arcToPoint(
        Offset(centerX + hourglassWidth, top + 4),
        radius: const Radius.circular(8),
        clockwise: true,
      )
      ..lineTo(centerX + hourglassWidth - 2, top + 8)
      ..quadraticBezierTo(centerX + hourglassWidth - 2,
          (top + halfHeight) / 2 + 2, centerX + gapWidth, halfHeight)
      ..quadraticBezierTo(centerX + hourglassWidth - 2,
          (bottom + halfHeight) / 2, centerX + hourglassWidth - 2, bottom - 7)
      ..arcToPoint(
        Offset(centerX + hourglassWidth, bottom),
        radius: const Radius.circular(8),
        clockwise: true,
      )
      ..lineTo(centerX - hourglassWidth, bottom)
      ..arcToPoint(
        Offset(centerX - hourglassWidth, bottom - 4),
        radius: const Radius.circular(8),
        clockwise: true,
      )
      ..lineTo(centerX - hourglassWidth + 2, bottom - 8)
      ..quadraticBezierTo(centerX - hourglassWidth + 2,
          (bottom + halfHeight) / 2, centerX - gapWidth, halfHeight)
      ..quadraticBezierTo(centerX - hourglassWidth + 2,
          (top + halfHeight) / 2 + 2, centerX - hourglassWidth + 2, top + 7)
      ..arcToPoint(
        Offset(centerX - hourglassWidth, top),
        radius: const Radius.circular(8),
        clockwise: true,
      )
      ..close();
    canvas.drawPath(hourglassPath, _paint);

    final upperPart = Path()
      ..moveTo(0.0, top)
      ..addRect(
          Rect.fromLTRB(0.0, halfHeight * poured!, size.width, halfHeight));
    canvas.drawPath(
        Path.combine(PathOperation.intersect, hourglassPath, upperPart),
        _powderPaint);

    final lowerPartPath = Path()
      ..moveTo(centerX, bottom)
      ..relativeLineTo(hourglassWidth * poured!, 0.0)
      ..lineTo(centerX, bottom - poured! * halfHeight - gapWidth)
      ..lineTo(centerX - hourglassWidth * poured!, bottom)
      ..close();
    final lowerPart = Path.combine(
      PathOperation.intersect,
      lowerPartPath,
      Path()..addRect(Rect.fromLTRB(0.0, halfHeight, size.width, size.height)),
    );
    canvas.drawPath(lowerPart, _powderPaint);

    canvas.drawLine(
        Offset(centerX, halfHeight), Offset(centerX, bottom), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
