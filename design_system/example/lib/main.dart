// ignore_for_file: library_private_types_in_public_api

import 'package:design_system/design_system.dart';
import 'package:example/stories/card/card.dart';
import 'package:example/stories/dialogs/dialogs.dart';
import 'package:example/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'stories/bottom_bar/bottom_bar.dart';
import 'stories/button/button.dart';
import 'stories/color_picker/color_picker.dart';
import 'stories/elevated/elevated.dart';
import 'stories/floating_items/floating_items.dart';
import 'stories/premium_banner/premium_banner.dart';
import 'stories/styleguide/styleguide.dart';
import 'theme/theme.dart';

final _plugins = initializePlugins(
  contentsSidePanel: true,
  knobsSidePanel: true,
  initialDeviceFrameData: DeviceFrameData(
    device: Devices.ios.iPhone13,
  ),
);

void main() => runApp(ChangeNotifierProvider(
    create: (context) => ThemeController(AppBaseColors.chili),
    child: const MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    AppMessageHelper.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppMessageHelper.init(context);
    return GlobalLoaderOverlay(
      child: Consumer<ThemeController>(
        builder: (context, value, child) => Storybook(
          wrapperBuilder: (context, child) =>
              materialWrapper(context, child, value),
          plugins: _plugins,
          stories: [
            ...styleguideStories,
            ...cardStories,
            ...buttonStories,
            ...floatingItemsStories,
            ...elevatedStories,
            ...dialogStories,
            premiumBannerStory,
            bottomBarStory,
            themeStory,
            colorPickerStory,
          ],
        ),
      ),
    );
  }

  Widget materialWrapper(
          BuildContext context, Widget? child, ThemeController theme) =>
      MaterialApp(
        theme: theme.lightTheme,
        darkTheme: theme.darkTheme,
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        home: Builder(builder: (context) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Center(child: child),
          );
        }),
      );
}
