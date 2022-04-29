import 'package:flutter/material.dart';

import 'bottom_bar_item.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({
    Key? key,
    required this.initialPage,
    required this.items,
  }) : super(key: key);

  final int initialPage;
  final List<AppBottomBarItemModel> items;

  @override
  State<AppBottomBar> createState() => AppBottomBarState();
}

class AppBottomBarState extends State<AppBottomBar> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 24,
              offset: Offset(0, -4),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: Material(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List<Widget>.generate(
                widget.items.length,
                (i) => Expanded(
                  child: AppBottomBarItem(
                    key: widget.items[i].key != null
                        ? ValueKey(widget.items[i].key!)
                        : null,
                    enabled: i == _currentIndex,
                    icon: widget.items[i].icon,
                    text: widget.items[i].text,
                    hasNotification: widget.items[i].hasNotification,
                    onTap: () => selectBottomBarItem(i),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  void selectBottomBarItem(int index) {
    setState(() {
      widget.items[index].onTap();
      _currentIndex = index;
    });
  }
}
