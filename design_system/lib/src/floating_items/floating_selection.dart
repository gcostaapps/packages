import '../card/clickable_card.dart';
import '../card/fixed_card.dart';
import 'package:flutter/material.dart';

import 'floating_selection_wrapper.dart';

class FloatingSelection extends StatelessWidget {
  const FloatingSelection({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.child,
  });

  final Widget child;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return FixedCard(
        elevation: 8,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: FloatingSelectionWrapper(
          isSelected: isSelected,
          child: child,
        ),
      );
    }

    return ClickableCard(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      onTap: onTap,
      child: FloatingSelectionWrapper(
        isSelected: isSelected,
        child: child,
      ),
    );
  }
}
