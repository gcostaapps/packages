import 'base_button.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.text,
    this.iconPosition = IconPosition.right,
    this.onTap,
    this.iconData,
    this.padding,
    this.wide = false,
    this.textColor,
  }) : super(key: key);

  final String text;
  final IconPosition iconPosition;
  final VoidCallback? onTap;
  final IconData? iconData;
  final EdgeInsets? padding;
  final bool wide;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 4),
        child: BaseButton(
          text: text,
          iconPosition: iconPosition,
          wide: wide,
          enabled: onTap != null,
          isPrimary: false,
          iconData: iconData,
          textColor: textColor,
        ),
      ),
    );
  }
}
