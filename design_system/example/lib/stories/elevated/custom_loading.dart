import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final customLoadingStory = Story(
  name: 'Widgets/Messages and Dialogs/App Loading',
  builder: (BuildContext context) {
    final spinChild = context.knobs.boolean(
      label: 'Custom Spin',
      initial: false,
    );

    final text = context.knobs.text(label: 'Text', initial: '');

    return CustomOutlinedButton(
      text: 'Show Loading',
      onTap: () {
        context.loaderOverlay.show(
            widget: CustomLoading(
          cancelable: false,
          text: text,
          spinChild: spinChild ? const CustomLoadingCube() : null,
        ));

        Future.delayed(
          const Duration(seconds: 5),
          () => context.loaderOverlay.hide(),
        );
      },
    );
  },
);

class CustomLoadingCube extends StatefulWidget {
  const CustomLoadingCube({Key? key}) : super(key: key);

  @override
  State<CustomLoadingCube> createState() => _CustomLoadingCubeState();
}

class _CustomLoadingCubeState extends State<CustomLoadingCube>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200))
      ..repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.inkDrop(
        color: AppBaseColors.offWhite,
        size: 40,
      ),
    );
  }
}
