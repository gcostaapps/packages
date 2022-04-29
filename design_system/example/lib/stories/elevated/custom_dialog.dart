import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final customDialogStory = Story(
  name: 'Widgets/Dialog Wrapper',
  builder: (BuildContext context) {
    return CustomOutlinedButton(
      text: 'Widgets/Show Message',
      onTap: () => AppDialogTransition.showDialogBlurred(
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
