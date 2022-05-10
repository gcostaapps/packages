import 'package:flutter/material.dart';

import '../../design_system.dart';

class WidgetDialog extends StatelessWidget {
  const WidgetDialog({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final dialog = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        color: context.colorScheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width - 32,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: child,
        ),
      ),
    );

    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          const EdgeInsets.symmetric(vertical: 24),
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Align(
          alignment: Alignment.center,
          child: Scrollbar(
            child: SingleChildScrollView(
              child: dialog,
            ),
          ),
        ),
      ),
    );
  }
}
