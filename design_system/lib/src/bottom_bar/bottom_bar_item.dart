import '../theme/colors/app_base_colors.dart';
import '../utils/app_spacers.dart';
import 'package:flutter/material.dart';

class AppBottomBarItemModel {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final String? key;

  AppBottomBarItemModel({
    required this.text,
    required this.icon,
    required this.onTap,
    this.key,
  });
}

class AppBottomBarItem extends StatelessWidget {
  const AppBottomBarItem({
    Key? key,
    required this.enabled,
    required this.onTap,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final bool enabled;
  final VoidCallback onTap;
  final IconData icon;
  final String text;

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
            Icon(
              icon,
              size: 20,
              color: enabled
                  ? theme.colorScheme.onSurface
                  : AppBaseColors.placeholder,
            ),
            SpacerHeight4,
            Text(
              text,
              style: theme.textTheme.caption!.copyWith(
                fontWeight: FontWeight.w600,
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
