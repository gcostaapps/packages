import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final fixedCardStory = Story(
  name: 'Widgets/Card/Fixed Card',
  builder: (BuildContext context) {
    final colorful = context.knobs.boolean(label: 'Colorful', initial: false);

    return FixedCard(
      shadowColor: colorful
          ? Theme.of(context).primaryColorLight.withOpacity(0.5)
          : null,
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          color: colorful
              ? Theme.of(context).primaryColor
              : Theme.of(context).cardColor,
        ),
      ),
    );
  },
);
