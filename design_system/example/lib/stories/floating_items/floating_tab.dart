import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final floatingTabStory = Story(
  name: 'Widgets/Floating/Floating Tab Item',
  builder: (BuildContext context) {
    return const FloatingTabExample();
  },
);

class FloatingTabItemModel {
  final String text;
  final VoidCallback onTap;

  FloatingTabItemModel({
    required this.text,
    required this.onTap,
  });
}

class FloatingTabExample extends HookWidget {
  const FloatingTabExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedTab = useState(0);
    final items = [
      FloatingTabItemModel(
        text: 'Dia',
        onTap: () => selectedTab.value = 0,
      ),
      FloatingTabItemModel(
        text: 'Semana',
        onTap: () => selectedTab.value = 1,
      ),
    ];
    final tabItems = List<Widget>.generate(
      items.length,
      (i) => Padding(
        padding: EdgeInsets.only(right: i != items.length - 1 ? 24 : 0),
        child: FloatingTabItem(
          isSelected: i == selectedTab.value,
          onTap: () {
            items[i].onTap();
            selectedTab.value = i;
          },
          text: items[i].text,
        ),
      ),
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: tabItems,
          ),
        ),
        Expanded(
          child: Text(
            selectedTab.value.toString(),
          ),
        ),
      ],
    );
  }
}
