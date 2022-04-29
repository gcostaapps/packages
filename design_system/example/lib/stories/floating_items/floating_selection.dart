import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final floatingSelectionStory = Story(
  name: 'Widgets/Floating/Floating Selection',
  builder: (BuildContext context) {
    return const FloatingSelectionExample();
  },
);

class FloatingSelectionExample extends HookWidget {
  const FloatingSelectionExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemSelected = useState(0);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Center(
        child: Row(
          children: List.generate(
            10,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FloatingSelection(
                isSelected: index == itemSelected.value,
                onTap: () => itemSelected.value = index,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
