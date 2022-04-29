import 'package:flutter/material.dart';

import '../../design_system.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.text,
    this.iconPosition = IconPosition.right,
    this.onTap,
    this.iconData,
    this.wide = true,
    this.buttonSize = ButtonSize.medium,
    this.isPrimary = true,
    this.borderRadius = 12,
  }) : super(key: key);

  final String text;
  final IconPosition iconPosition;
  final VoidCallback? onTap;
  final IconData? iconData;
  final bool wide;
  final ButtonSize buttonSize;
  final bool isPrimary;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClickableCard(
      borderRadius: BorderRadius.circular(borderRadius),
      shadowColor: (onTap != null && isPrimary)
          ? context.theme.primaryColorLight.withOpacity(
              context.theme.brightness == Brightness.light ? 0.75 : 0.1,
            )
          : null,
      onTap: onTap,
      child: Container(
        color: onTap != null
            ? isPrimary
                ? null
                : context.theme.cardColor
            : context.theme.disabledColor,
        decoration: onTap != null && isPrimary
            ? BoxDecoration(gradient: context.linearGradient)
            : null,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: BaseButton(
          text: text,
          iconPosition: iconPosition,
          wide: wide,
          enabled: onTap != null,
          isPrimary: isPrimary,
          iconData: iconData,
          buttonSize: buttonSize,
        ),
      ),
    );
  }
}
