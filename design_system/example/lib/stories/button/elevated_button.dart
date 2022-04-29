import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final elevatedButtonStory = Story(
  name: 'Widgets/Buttons/Elevated Button',
  builder: (BuildContext context) {
    final enabled = context.knobs.boolean(label: 'Enabled', initial: true);
    final radius =
        context.knobs.slider(label: 'Radius', initial: 50, min: 0, max: 50);
    final wide = context.knobs.boolean(label: 'Wide', initial: true);
    final primary = context.knobs.boolean(label: 'Primary', initial: true);
    final text = context.knobs.text(label: 'Text', initial: 'CONTINUAR');
    final size = context.knobs.options(
      label: 'Size',
      initial: ButtonSize.medium,
      options: const [
        Option(label: 'Medium', value: ButtonSize.medium),
        Option(label: 'Small', value: ButtonSize.small),
      ],
    );
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

    return CustomElevatedButton(
      text: text,
      onTap: enabled ? () => {} : null,
      wide: wide,
      iconData: icon,
      buttonSize: size,
      iconPosition: iconPosition,
      isPrimary: primary,
      borderRadius: radius,
    );
  },
);
