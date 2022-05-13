import 'package:flutter/material.dart';

import '../../design_system.dart';

class DialogIconWeb extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const DialogIconWeb({Key? key, required this.icon, required this.onTap})
      : super(key: key);

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
