import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final customDialogStory = Story(
  name: 'Widgets/Messages and Dialogs Wrapper',
  builder: (BuildContext context) {
    return CustomOutlinedButton(
      text: 'Show Message',
      onTap: () => AppDialogTransition.showDialog(
        context,
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Hello'),
            Container(
              height: 200,
              width: 800,
              color: Colors.red,
            ),
            const Text('Hello'),
          ],
        ),
      ),
    );
  },
);
