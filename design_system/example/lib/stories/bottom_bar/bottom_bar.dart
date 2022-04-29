import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final bottomBarStory = Story(
  name: 'Widgets/BottomBar',
  builder: (BuildContext context) {
    return const BottomBarExample();
  },
);

class BottomBarExample extends HookWidget {
  const BottomBarExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedPage = useState(2);
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Text(
              selectedPage.value.toString(),
            ),
          ),
          AppBottomBar(
            initialPage: selectedPage.value,
            items: [
              AppBottomBarItemModel(
                text: 'Hábitos',
                icon: Icons.repeat,
                onTap: () => selectedPage.value = 0,
              ),
              AppBottomBarItemModel(
                text: 'Estatísticas',
                icon: Icons.repeat,
                onTap: () => selectedPage.value = 1,
              ),
              AppBottomBarItemModel(
                text: 'Registros',
                icon: Icons.repeat,
                onTap: () => selectedPage.value = 2,
              ),
              AppBottomBarItemModel(
                text: 'Perfil',
                icon: Icons.repeat,
                onTap: () => selectedPage.value = 3,
              ),
            ],
          )
        ],
      ),
    );
  }
}
