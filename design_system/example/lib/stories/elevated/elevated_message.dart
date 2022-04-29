import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final elevatedMessagesStory = Story(
  name: 'Widgets/Messages and Dialogs/Elevated Messages',
  builder: (BuildContext context) {
    final title = context.knobs.text(label: 'Title', initial: '');
    final message =
        context.knobs.text(label: 'Message', initial: 'Message Test');

    final messageType = context.knobs.options(
      label: 'Message Type',
      initial: MessageEnum.success,
      options: const [
        Option(label: 'Success', value: MessageEnum.success),
        Option(label: 'Info', value: MessageEnum.info),
        Option(label: 'Warning', value: MessageEnum.warning),
        Option(label: 'Error', value: MessageEnum.error),
      ],
    );

    return CustomOutlinedButton(
      text: 'Show Message',
      onTap: () => AppMessageHelper.messageBar(
        context,
        message: message,
        title: title.isEmpty ? null : title,
        messageEnum: messageType,
      ),
    );
  },
);
