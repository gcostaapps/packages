import 'package:flutter/material.dart';

import '../card/clickable_card.dart';
import '../card/fixed_card.dart';
import '../theme/app_theme.dart';

class FloatingTabItem extends StatelessWidget {
  const FloatingTabItem({
    Key? key,
    required this.isSelected,
    required this.onTap,
    required this.text,
    this.floating = true,
    this.icon,
  }) : super(key: key);

  final bool isSelected;
  final VoidCallback onTap;
  final String text;
  final IconData? icon;
  final bool floating;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (isSelected) {
      return FixedCard(
        elevation: 8,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        shadowColor: theme.primaryColorLight.withOpacity(
          context.theme.brightness == Brightness.light ? 0.3 : 0.05,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: context.linearGradient,
            border: Border.all(
              color: theme.primaryColor,
              width: 1.5,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Icon(
                    icon,
                    color: theme.colorScheme.onPrimary,
                    size: 20,
                  ),
                ),
              Text(
                text,
                style: theme.textTheme.titleSmall!.copyWith(
                  fontSize: 12,
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
    } else if (!floating) {
      return GestureDetector(
        onTap: onTap,
        child: FixedCard(
          elevation: 0,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: theme.primaryColor,
                width: 1.5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      icon,
                      color: theme.colorScheme.onPrimary,
                      size: 20,
                    ),
                  ),
                Text(
                  text,
                  style: theme.textTheme.titleSmall!.copyWith(
                    fontSize: 12,
                    color: theme.colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return ClickableCard(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: theme.colorScheme.surface,
            width: 1.5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Icon(
                  icon,
                  size: 20,
                ),
              ),
            Text(
              text,
              style: theme.textTheme.titleSmall!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
