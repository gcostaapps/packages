import 'package:flutter/material.dart';

class FixedCard extends StatelessWidget {
  const FixedCard({
    Key? key,
    this.borderRadius,
    this.shadowColor,
    required this.child,
    this.elevation = 4,
  }) : super(key: key);

  final BorderRadius? borderRadius;
  final Color? shadowColor;
  final Widget child;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius:
            borderRadius ?? const BorderRadius.all(Radius.circular(4)),
      ),
      shadowColor: shadowColor,
      child: child,
    );
  }
}
