import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final customLoadingStory = Story(
  name: 'Widgets/Messages and Dialogs/App Loading',
  builder: (BuildContext context) {
    return CustomOutlinedButton(
      text: 'Show Loading',
      onTap: () {
        AppDialogTransition.showAppLoading(context);
        Future.delayed(
          const Duration(seconds: 5),
          () => Navigator.pop(context),
        );
      },
    );
  },
);
