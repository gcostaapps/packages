import 'package:flutter/material.dart';

import '../../design_system.dart';

class FloatingMenu extends StatelessWidget {
  const FloatingMenu({
    Key? key,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.iconData,
    this.rightWidget,
    this.borderRadius,
    this.iconFaded = true,
    this.floating = true,
    this.iconSize = 32,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;
  final String? subtitle;
  final IconData? iconData;
  final Widget? rightWidget;
  final BorderRadius? borderRadius;
  final bool iconFaded;
  final bool floating;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final menu = Ink(
      color: theme.cardColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (subtitle != null) ...[
                    SpacerHeight4,
                    Text(
                      subtitle!.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.overline!.copyWith(
                        color: theme.colorScheme.onBackground,
                      ),
                    )
                  ],
                ],
              ),
            ),
            if (rightWidget != null) rightWidget!,
            if (iconData != null)
              Icon(
                iconData,
                size: iconSize,
                color: iconFaded
                    ? theme.disabledColor
                    : AppColors(theme.brightness).textColor200,
              ),
          ],
        ),
      ),
    );

    if (floating) {
      return ClickableCard(
        borderRadius:
            borderRadius ?? const BorderRadius.all(Radius.circular(12)),
        onTap: onTap,
        child: menu,
      );
    }
    return Material(
      child: InkWell(
        onTap: onTap,
        child: menu,
      ),
    );
  }
}
