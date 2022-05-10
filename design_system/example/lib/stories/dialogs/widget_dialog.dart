import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final widgetDialogStory = Story(
  name: 'Widgets/Dialogs/Widget Dialog',
  builder: (BuildContext context) {
    return WidgetDialog(
      child: Container(
        color: Colors.red,
        padding: const EdgeInsets.all(40),
        child: const Text('Widget'),
      ),
    );
  },
);
