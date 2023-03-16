import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../../design_system.dart';

class AppBottomBarItemModel {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final bool hasNotification;

  final String? key;

  AppBottomBarItemModel({
    required this.text,
    required this.icon,
    required this.onTap,
    this.key,
    this.hasNotification = false,
  });
}

class AppBottomBarItem extends StatelessWidget {
  const AppBottomBarItem({
    Key? key,
    required this.enabled,
    required this.onTap,
    required this.icon,
    required this.text,
    required this.hasNotification,
  }) : super(key: key);

  final bool enabled;
  final VoidCallback onTap;
  final IconData icon;
  final String text;
  final bool hasNotification;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        height: kBottomNavigationBarHeight,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!hasNotification)
              Icon(
                icon,
                size: 20,
                color: enabled
                    ? theme.colorScheme.onSurface
                    : AppBaseColors.placeholder,
              ),
            if (hasNotification)
              badges.Badge(
                badgeAnimation: const badges.BadgeAnimation.scale(
                  toAnimate: false,
                ),
                position: badges.BadgePosition.topEnd(end: -8, top: -4),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: context.colorScheme.primary,
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: enabled
                      ? theme.colorScheme.onSurface
                      : AppBaseColors.placeholder,
                ),
              ),
            SpacerHeight4,
            Text(
              text,
              style: theme.textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w500,
                color: enabled
                    ? theme.colorScheme.onSurface
                    : AppBaseColors.placeholder,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
