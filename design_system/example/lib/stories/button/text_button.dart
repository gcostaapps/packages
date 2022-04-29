import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final textButtonStory = Story(
  name: 'Widgets/Text Button',
  builder: (BuildContext context) {
    final enabled = context.knobs.boolean(label: 'Enabled', initial: true);
    final text = context.knobs.text(label: 'Text', initial: 'CONTINUAR');

    final iconPosition = context.knobs.options(
      label: 'Icon Position',
      initial: IconPosition.right,
      options: const [
        Option(label: 'Right', value: IconPosition.right),
        Option(label: 'Left', value: IconPosition.left),
      ],
    );
    final icon = context.knobs.options<IconData?>(
      label: 'Icon',
      initial: null,
      options: const [
        Option(label: 'No Icon', value: null),
        Option(label: 'Foward', value: Icons.arrow_forward),
        Option(label: 'Backward', value: Icons.arrow_back),
      ],
    );

    return CustomTextButton(
      text: text,
      onTap: enabled ? () => {} : null,
      iconData: icon,
      iconPosition: iconPosition,
    );
  },
);
