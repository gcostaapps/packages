import 'package:flutter/material.dart';

import '../../design_system.dart';

class DialogIconWeb extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const DialogIconWeb({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 24,
      icon: Icon(
        icon,
        color: context.colorScheme.onBackground,
      ),
      onPressed: onTap,
    );
  }
}
