import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final typographyStory = Story(
  name: 'Styleguide/Typography',
  builder: (BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Headline 1', style: Theme.of(context).textTheme.displayLarge),
        Text('Headline 2', style: Theme.of(context).textTheme.displayMedium),
        Text('Headline 3', style: Theme.of(context).textTheme.displaySmall),
        Text('Headline 4', style: Theme.of(context).textTheme.headlineMedium),
        Text('Headline 5', style: Theme.of(context).textTheme.headlineSmall),
        Text('Headline 6', style: Theme.of(context).textTheme.titleLarge),
        Text('Subtitle 1', style: Theme.of(context).textTheme.titleMedium),
        Text('Subtitle 2', style: Theme.of(context).textTheme.titleSmall),
        Text('Body 1', style: Theme.of(context).textTheme.bodyLarge),
        Text('Body 2', style: Theme.of(context).textTheme.bodyMedium),
        Text('BUTTON', style: Theme.of(context).textTheme.labelLarge),
        Text('bodySmall', style: Theme.of(context).textTheme.bodySmall),
        Text('labelSmall', style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  },
);
