import 'package:flutter/material.dart';

class CircleColor extends StatelessWidget {
  static const double _kColorElevation = 4.0;

  final bool isSelected;
  final Color color;
  final VoidCallback? onColorChoose;
  final double? elevation;
  final IconData? iconSelected;
  final bool forceIconColorToThemeBrightness;

  const CircleColor({
    super.key,
    required this.color,
    this.onColorChoose,
    this.isSelected = false,
    this.forceIconColorToThemeBrightness = false,
    this.elevation = _kColorElevation,
    this.iconSelected,
  })  : assert(!isSelected || (isSelected && iconSelected != null));

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = forceIconColorToThemeBrightness
        ? Theme.of(context).brightness == Brightness.light
            ? Brightness.dark
            : Brightness.light
        : ThemeData.estimateBrightnessForColor(color);

    final icon = brightness == Brightness.light ? Colors.black : Colors.white;

    return GestureDetector(
      onTap: onColorChoose,
      child: Material(
        elevation: elevation ?? _kColorElevation,
        shape: const CircleBorder(),
        child: CircleAvatar(
          backgroundColor: color,
          child: isSelected ? Icon(iconSelected, color: icon) : null,
        ),
      ),
    );
  }
}
