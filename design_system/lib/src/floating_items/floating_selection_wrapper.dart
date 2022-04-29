import 'package:flutter/material.dart';

class FloatingSelectionWrapper extends StatelessWidget {
  const FloatingSelectionWrapper({
    Key? key,
    required this.isSelected,
    required this.child,
  }) : super(key: key);

  final bool isSelected;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: isSelected ? theme.colorScheme.onSurface : Colors.transparent,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 12,
      ),
      child: child,
    );
  }
}
