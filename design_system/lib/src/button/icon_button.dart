import 'package:flutter/material.dart';

import '../../design_system.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    this.onTap,
    required this.iconData,
    this.buttonSize = ButtonSize.medium,
    this.withElevation = true,
    this.color,
  }) : super(key: key);

  final VoidCallback? onTap;
  final IconData iconData;
  final ButtonSize buttonSize;
  final bool withElevation;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    late double padding;
    late double radius;
    switch (buttonSize) {
      case ButtonSize.small:
        padding = 8;
        radius = 8;
        break;
      case ButtonSize.medium:
        padding = 16;
        radius = 10;
        break;
    }

    if (withElevation) {
      return ClickableCard(
        borderRadius: BorderRadius.circular(radius),
        onTap: onTap,
        child: Container(
          color: onTap != null ? theme.cardColor : theme.disabledColor,
          padding: EdgeInsets.all(padding),
          child: Icon(
            iconData,
            size: 24,
            color: onTap != null
                ? theme.colorScheme.onSurface
                : AppBaseColors.placeholder,
          ),
        ),
      );
    }

    return FixedCard(
      borderRadius: BorderRadius.circular(radius),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: onTap != null ? theme.cardColor : theme.disabledColor,
          padding: EdgeInsets.all(padding),
          child: Icon(
            iconData,
            size: 24,
            color: onTap != null
                ? color ?? theme.colorScheme.onSurface
                : AppBaseColors.placeholder,
          ),
        ),
      ),
    );
  }
}
