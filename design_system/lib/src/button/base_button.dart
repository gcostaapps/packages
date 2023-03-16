import '../theme/colors/app_base_colors.dart';
import 'package:flutter/material.dart';

enum IconPosition {
  right,
  left,
}

enum ButtonSize {
  small,
  medium,
}

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    required this.text,
    this.iconPosition = IconPosition.right,
    required this.enabled,
    this.iconData,
    this.isPrimary = true,
    required this.wide,
    this.textColor,
    this.buttonSize = ButtonSize.medium,
  }) : super(key: key);

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
        iconPadding = 12;
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
          ? const EdgeInsets.only(top: 3)
          : EdgeInsets.fromLTRB(iconPadding, 3, iconPadding, 0),
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

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: SizedBox(
        height: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: wide ? MainAxisSize.max : MainAxisSize.min,
            children: [
              if (iconData != null)
                SizedBox(
                  width:
                      iconPosition == IconPosition.left || wide ? iconSize : 0,
                  child: iconPosition == IconPosition.left ? icon : null,
                ),
              if (wide) Expanded(child: textWidget),
              if (!wide) Flexible(child: textWidget),
              if (iconData != null)
                SizedBox(
                  width:
                      iconPosition == IconPosition.right || wide ? iconSize : 0,
                  child: iconPosition == IconPosition.right ? icon : null,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
