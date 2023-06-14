import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:services_core/services_core.dart';

class ClickableCard extends StatefulWidget {
  const ClickableCard({
    Key? key,
    this.borderRadius,
    this.onTap,
    this.shadowColor,
    required this.child,
  }) : super(key: key);

  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final Color? shadowColor;

  final Widget child;

  @override
  State<ClickableCard> createState() => _ClickableCardState();
}

class _ClickableCardState extends State<ClickableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  bool isWithFocus = false;
  bool isInHover = false;

  bool get isFocused => isWithFocus || isInHover;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
    );

    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final shadowColorWithOpacity = widget.shadowColor != null
        ? widget.shadowColor!.withOpacity(
            theme.brightness == Brightness.light ? 0.3 : 0.05,
          )
        : null;

    if (widget.onTap == null) {
      return Card(
        color: theme.disabledColor,
        shape: RoundedRectangleBorder(
          borderRadius:
              widget.borderRadius ?? const BorderRadius.all(Radius.circular(4)),
        ),
        elevation: 20,
        shadowColor: shadowColorWithOpacity,
        child: widget.child,
      );
    }

    //Check if is Web Or Desktop

    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      child: InkWell(
        mouseCursor: SystemMouseCursors.click,
        onTap: onTap,
        onHover: (v) => setState(() => isInHover = v),
        onFocusChange: (v) => setState(() => isWithFocus = v),
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        borderRadius:
            widget.borderRadius ?? const BorderRadius.all(Radius.circular(4)),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: 1 - 0.03 * animation.value,
              child: Stack(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: widget.borderRadius ??
                          const BorderRadius.all(Radius.circular(4)),
                    ),
                    elevation: 16 - 8 * animation.value,
                    shadowColor: shadowColorWithOpacity,
                    child: child,
                  ),
                  if (isFocused && DeviceOS.isDesktopOrWeb)
                    IgnorePointer(
                      ignoring: true,
                      ignoringSemantics: true,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onSurface.withOpacity(0.02),
                          border: Border.all(
                              width: 1,
                              color:
                                  theme.colorScheme.onSurface.withOpacity(0.5)),
                          borderRadius: widget.borderRadius ??
                              const BorderRadius.all(Radius.circular(4)),
                        ),
                        child: Opacity(
                          opacity: 0,
                          child: child,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
          child: widget.child,
        ),
      ),
    );
  }

  void onTap() {
    _controller.forward().then((value) => _controller.reverse());
    widget.onTap!();
  }
}
