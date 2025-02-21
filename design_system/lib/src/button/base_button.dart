import '../theme/colors/app_base_colors.dart';
import 'package:flutter/material.dart';

enum IconPosition {
  right,
  left,
  centerRight,
  centerLeft,
}

enum ButtonSize {
  small,
  medium,
}

class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    required this.text,
    this.iconPosition = IconPosition.right,
    required this.enabled,
    this.iconData,
    this.isPrimary = true,
    required this.wide,
    this.textColor,
    this.buttonSize = ButtonSize.medium,
  });

  final String text;
  final IconPosition iconPosition;
  final bool enabled;
  final IconData? iconData;
  final bool isPrimary;
  final bool wide;
  final Color? textColor;
  final ButtonSize buttonSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    late double height;
    late double iconSize;
    late double iconPadding;
    switch (buttonSize) {
      case ButtonSize.small:
        height = 24;
        iconSize = 20;
        iconPadding = 8;
        break;
      case ButtonSize.medium:
        height = 40;
        iconSize = 24;
        iconPadding = 16;
        break;
    }

    final buttonColor = textColor ??
        (enabled
            ? isPrimary
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onSurface
            : AppBaseColors.placeholder);

    final icon = iconData != null
        ? Icon(
            iconData,
            size: iconSize,
            color: buttonColor,
          )
        : null;

    final textWidget = Padding(
      padding: iconData == null
          ? const EdgeInsets.all(0)
          : EdgeInsets.symmetric(horizontal: iconPadding),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: theme.textTheme.labelLarge!.copyWith(
          color: buttonColor,
        ),
      ),
    );

    final hasCenterIcon = iconPosition == IconPosition.centerLeft ||
        iconPosition == IconPosition.centerRight && iconData != null;
    final hasLeftIcon = iconPosition == IconPosition.left ||
        iconPosition == IconPosition.centerLeft;
    final hasRightIcon = iconPosition == IconPosition.right ||
        iconPosition == IconPosition.centerRight;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: SizedBox(
        height: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: wide ? MainAxisSize.max : MainAxisSize.min,
            children: [
              if (iconData != null)
                SizedBox(
                  width: (hasLeftIcon || wide) && !hasRightIcon ? iconSize : 0,
                  child: hasLeftIcon ? icon : null,
                ),
              if (wide && !hasCenterIcon) Expanded(child: textWidget),
              if (!wide || hasCenterIcon) Flexible(child: textWidget),
              if (iconData != null)
                SizedBox(
                  width: (hasRightIcon || wide) && !hasLeftIcon ? iconSize : 0,
                  child: hasRightIcon ? icon : null,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
