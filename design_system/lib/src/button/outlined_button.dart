import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'base_button.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.text,
    this.iconPosition = IconPosition.right,
    this.onTap,
    this.iconData,
    this.wide = true,
    this.buttonSize = ButtonSize.medium,
    this.isPrimary = true,
    this.radius = 6,
    this.color,
  }) : super(key: key);

  final String text;
  final IconPosition iconPosition;
  final VoidCallback? onTap;
  final IconData? iconData;
  final bool wide;
  final ButtonSize buttonSize;
  final bool isPrimary;
  final double radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Ink(
            decoration: BoxDecoration(
              color: onTap != null
                  ? color ?? (isPrimary ? null : context.theme.cardColor)
                  : context.theme.disabledColor,
              gradient: onTap != null && color == null && isPrimary
                  ? context.linearGradient
                  : null,
              border: isPrimary
                  ? null
                  : Border.all(
                      color: onTap != null
                          ? color ?? context.theme.colorScheme.onBackground
                          : context.theme.disabledColor,
                      width: 2,
                    ),
              borderRadius: BorderRadius.circular(radius),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: BaseButton(
              text: text,
              iconPosition: iconPosition,
              wide: wide,
              enabled: onTap != null,
              isPrimary: isPrimary || color != null,
              iconData: iconData,
              buttonSize: buttonSize,
            ),
          ),
        ),
      ),
    );
  }
}
