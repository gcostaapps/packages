import 'package:design_system/design_system.dart';
import 'package:example/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final themeStory = Story(
  name: 'Styleguide/Theme',
  builder: (BuildContext context) {
    return Wrap(
      children: [
        Container(
          height: 160,
          width: 160,
          color: Theme.of(context).primaryColorLight,
          child: const Text('LightPrimaryColor'),
        ),
        Container(
          height: 160,
          width: 160,
          color: Theme.of(context).primaryColor,
          child: const Text('PrimaryColor'),
        ),
        GestureDetector(
          onTap: () => Provider.of<ThemeController>(context, listen: false)
              .changeTheme(AppBaseColors.lavender),
          child: Container(
            height: 160,
            width: 160,
            color: Theme.of(context).primaryColorDark,
            child: const Text('DarkPrimaryColor'),
          ),
        ),
      ],
    );
  },
);
