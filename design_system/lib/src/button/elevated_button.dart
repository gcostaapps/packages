import 'package:flutter/material.dart';

import '../../design_system.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.iconPosition = IconPosition.right,
    this.onTap,
    this.iconData,
    this.wide = true,
    this.loading = false,
    this.buttonSize = ButtonSize.medium,
    this.isPrimary = true,
    this.borderRadius = 12,
    this.color,
  });

  final String text;
  final IconPosition iconPosition;
  final VoidCallback? onTap;
  final IconData? iconData;
  final bool wide;
  final bool loading;
  final ButtonSize buttonSize;
  final bool isPrimary;
  final double borderRadius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Color? shadowColor;
    if (onTap != null) {
      if (color != null) {
        shadowColor = color!.withOpacity(
          context.theme.brightness == Brightness.light ? 0.75 : 0.1,
        );
      } else if (isPrimary) {
        shadowColor = context.theme.primaryColorLight.withOpacity(
          context.theme.brightness == Brightness.light ? 0.75 : 0.1,
        );
      }
    }
    return ClickableCard(
      borderRadius: BorderRadius.circular(borderRadius),
      shadowColor: shadowColor,
      onTap: loading ? null : onTap,
      child: Container(
        decoration: BoxDecoration(
          color: onTap != null
              ? color ?? (isPrimary ? null : context.theme.cardColor)
              : context.theme.disabledColor,
          gradient: onTap != null && color == null && isPrimary
              ? context.linearGradient
              : null,
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
          loading: loading,
        ),
      ),
    );
  }
}
