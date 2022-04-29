import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pegasus_icons/pegasus_icons.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final iconButtonStory = Story(
  name: 'Widgets/Icon Button',
  builder: (BuildContext context) {
    final enabled = context.knobs.boolean(label: 'Enabled', initial: true);
    final elevation = context.knobs.boolean(label: 'Elevation', initial: true);
    final size = context.knobs.options(
      label: 'Size',
      initial: ButtonSize.medium,
      options: const [
        Option(label: 'Medium', value: ButtonSize.medium),
        Option(label: 'Small', value: ButtonSize.small),
      ],
    );
    final icon = context.knobs.options<IconData>(
      label: 'Icon',
      initial: Icons.chevron_right,
      options: const [
        Option(label: 'Next', value: Icons.chevron_right),
        Option(label: 'Settings', value: Icons.settings),
        Option(label: 'Configure', value: PegasusIcons.configure),
      ],
    );

    return CustomIconButton(
      onTap: enabled ? () => {} : null,
      iconData: icon,
      buttonSize: size,
      withElevation: elevation,
    );
  },
);
