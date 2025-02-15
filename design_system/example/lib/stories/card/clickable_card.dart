import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final clickableCardStory = Story(
  name: 'Widgets/Card/Clickable Card',
  builder: (BuildContext context) {
    final theme = Theme.of(context);
    final colorful =
        context.knobs.boolean(label: 'Shadow colored', initial: false);

    return ClickableCard(
      onTap: () => {},
      shadowColor: colorful ? theme.primaryColorLight : null,
      child: Container(
          width: 320,
          height: 320,
          decoration: BoxDecoration(
            color: colorful
                ? Theme.of(context).primaryColor
                : Theme.of(context).cardColor,
          ),
          child: Column(
            children: [
              Text('Test'),
              ClickableCard(
                onTap: () => {},
                shadowColor: Colors.purple,
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                  ),
                ),
              ),
            ],
          )),
    );
  },
);
