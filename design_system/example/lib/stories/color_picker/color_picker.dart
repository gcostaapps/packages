import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../utils.dart';

final colorPickerStory = Story(
  name: 'Widgets/Color Picker',
  builder: (context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ColorPicker(
        allowShades: false,
        spacing: 24,
        numberOfLines: 3,
        shrinkWrap: true,
        colors: darkMode ? darkColors : lightColors,
        onMainColorChange: (color) {},
        selectedColor: darkMode ? darkColors[0] : lightColors[0],
      ),
    );
  },
);
