import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final shadowsStory = Story(
  name: 'Styleguide/Shadows',
  builder: (BuildContext context) {
    final shadowColor = context.knobs.options(
      label: 'Shadow',
      initial: const Color(0xFF000000).withOpacity(0.5),
      options: [
        Option<Color?>(
          label: 'Default',
          value: const Color(0xFF000000).withOpacity(0.5),
        ),
        Option<Color?>(
          label: 'Colorful',
          value: Theme.of(context).primaryColorLight.withOpacity(0.5),
        ),
      ],
    );
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: [
        Card(
          elevation: 4,
          shadowColor: shadowColor,
          child: Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: const Text('Low'),
          ),
        ),
        Card(
          elevation: 8,
          shadowColor: shadowColor,
          child: Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: const Text('Medium'),
          ),
        ),
        Card(
          elevation: 16,
          shadowColor: shadowColor,
          child: Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: const Text('High'),
          ),
        ),
      ],
    );
  },
);
