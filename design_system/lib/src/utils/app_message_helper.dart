import 'dart:async';
import 'dart:collection';

import '../theme/colors/app_base_colors.dart';
import 'app_spacers.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

class _MessageItem<T> {
  final String message;
  Completer<Future<T>> completer;

  _MessageItem(this.message) : completer = Completer<Future<T>>();
}

enum MessageEnum {
  success,
  info,
  warning,
  error,
}

// ignore: avoid_classes_with_only_static_members
class AppMessageHelper {
  static Completer<BuildContext> _buildCompleter = Completer<BuildContext>();
  static final Queue<_MessageItem> _messageQueue = Queue<_MessageItem>();

  static void init(BuildContext context) {
    if (!_buildCompleter.isCompleted) {
      _buildCompleter.complete(context);
    }
  }

  static void dispose() {
    _messageQueue.clear();

    if (!_buildCompleter.isCompleted) {
      _buildCompleter.completeError('NotInitialize');
    }
    _buildCompleter = Completer<BuildContext>();
  }

  static Future<T?> successBar<T>(
    BuildContext context, {
    String? title,
    required String message,
    Duration duration = const Duration(seconds: 1),
  }) =>
      messageBar(
        context,
        title: title,
        message: message,
        duration: duration,
        messageEnum: MessageEnum.success,
      );

  static Future<T?> infoBar<T>(
    BuildContext context, {
    String? title,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) =>
      messageBar(
        context,
        title: title,
        message: message,
        duration: duration,
        messageEnum: MessageEnum.info,
      );

  static Future<T?> warningBar<T>(
    BuildContext context, {
    String? title,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) =>
      messageBar(
        context,
        title: title,
        message: message,
        duration: duration,
        messageEnum: MessageEnum.warning,
      );

  static Future<T?> errorBar<T>(
    BuildContext context, {
    String? title,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) =>
      messageBar(
        context,
        title: title,
        message: message,
        duration: duration,
        messageEnum: MessageEnum.error,
      );

  // ignore: long-method, long-parameter-list
  static Future<T?> messageBar<T>(
    BuildContext context, {
    required MessageEnum messageEnum,
    String? title,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (context, controller) {
        final isDarkMode = Theme.of(context).brightness == Brightness.dark;

        final (Color color, IconData icon) = switch (messageEnum) {
          MessageEnum.success => (
              isDarkMode
                  ? AppBaseColors.successColor.shade200
                  : AppBaseColors.successColor.shade300,
              Icons.check
            ),
          MessageEnum.info => (
              isDarkMode
                  ? AppBaseColors.ocean.shade200
                  : AppBaseColors.ocean.shade500,
              Icons.info_outline
            ),
          MessageEnum.warning => (
              isDarkMode
                  ? AppBaseColors.warningColor.shade200
                  : AppBaseColors.warningColor.shade300,
              Icons.warning
            ),
          MessageEnum.error => (
              isDarkMode
                  ? AppBaseColors.errorColor.shade200
                  : AppBaseColors.errorColor.shade300,
              Icons.close
            ),
        };

        return FadeTransition(
          opacity: controller.controller,
          child: FlashBar(
            behavior: FlashBehavior.floating,
            controller: controller,
            position: FlashPosition.top,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            dismissDirections: const [
              FlashDismissDirection.endToStart,
              FlashDismissDirection.startToEnd
            ],
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    elevation: 12,
                    child: Container(
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.surface,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 8,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Icon(
                                  icon,
                                  size: 24,
                                  color: color,
                                ),
                              ),
                              SpacerWidth12,
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (title != null) ...[
                                      Text(
                                        title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      SpacerHeight4,
                                    ],
                                    Text(
                                      message,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<T?> widgetBar<T>(
    BuildContext context, {
    required Widget child,
    Duration duration = const Duration(seconds: 2),
  }) {
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (context, controller) => child,
    );
  }
}

typedef ChildBuilder<T> = Widget Function(
    BuildContext context, FlashController<T> controller, StateSetter setState);
