import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final floatingMenuStory = Story(
  name: 'Widgets/Floating/Floating Menu',
  builder: (BuildContext context) {
    final hasSubtitle =
        context.knobs.boolean(label: 'HasSubtitle', initial: true);
    final iconFaded = context.knobs.boolean(label: 'IconFaded', initial: true);

    return Center(
      child: FloatingMenu(
        onTap: () {},
        title: context.knobs.text(label: 'Título', initial: 'Título'),
        subtitle: hasSubtitle
            ? context.knobs.text(label: 'Subtítulo', initial: 'Subtítulo')
            : null,
        iconData: context.knobs.options(
          label: 'Icon',
          initial: null,
          options: const [
            Option(label: '', value: null),
            Option(label: 'Settings', value: Icons.settings)
          ],
        ),
        iconFaded: iconFaded,
      ),
    );
  },
);
