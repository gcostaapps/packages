import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../design_system.dart';

class CloseDialogIntent extends Intent {
  const CloseDialogIntent();
}

class WidgetDialogWeb extends StatelessWidget {
  final DialogIconWeb? leading;
  final DialogIconWeb? trailing;
  final String title;
  final Widget body;
  final Widget? actions;
  final double width;

  const WidgetDialogWeb({
    Key? key,
    this.leading,
    this.trailing,
    required this.title,
    required this.body,
    this.actions,
    this.width = 800,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.escape): const CloseDialogIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          CloseDialogIntent: CallbackAction<CloseDialogIntent>(
            onInvoke: (CloseDialogIntent intent) => Navigator.pop(context),
          ),
        },
        child: AnimatedPadding(
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
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 280.0),
                child: Material(
                  color: context.colorScheme.surface,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
                    width: width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 40,
                                child: leading ??
                                    IconButton(
                                        splashRadius: 24,
                                        icon: Icon(
                                          Icons.close,
                                          color:
                                              context.colorScheme.onBackground,
                                        ),
                                        onPressed: () =>
                                            Navigator.pop(context)),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    title,
                                    style:
                                        context.textTheme.headline6!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              trailing ?? SpacerWidth40,
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        Flexible(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: body,
                          ),
                        ),
                        if (actions != null) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                const Divider(),
                                const SizedBox(height: 16),
                                actions!,
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
