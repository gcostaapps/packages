// ignore_for_file: unnecessary_null_comparison
// ignore_for_file: long-parameter-list
// ignore_for_file: long-method

import 'dart:ui';

import 'package:flutter/material.dart';

import '../../design_system.dart';

class AppDialogTransition {
  static Future<T?> showDialog<T>(
    BuildContext context,
    Widget child, {
    bool barrierDismissible = true,
    Color? barrierColor = AppBaseColors.darkSurfaceColors,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
  }) {
    assert(debugCheckHasMaterialLocalizations(context));

    final CapturedThemes themes = InheritedTheme.capture(
      from: context,
      to: Navigator.of(
        context,
        rootNavigator: useRootNavigator,
      ).context,
    );

    return Navigator.of(context, rootNavigator: useRootNavigator)
        .push<T>(DialogRoute<T>(
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 8,
          sigmaY: 8,
        ),
        child: child,
      ),
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      settings: routeSettings,
      themes: themes,
    ));
  }

  static Future<T?> showDialogBlurred<T extends Object?>(
    BuildContext context,
    Widget child, {
    bool barrierDismissible = true,
  }) =>
      showGeneralDialog(
        barrierDismissible: barrierDismissible,
        barrierLabel: '',
        barrierColor: AppBaseColors.darkSurfaceColors,
        pageBuilder: (ctx, anim1, anim2) => child,
        transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 8,
            sigmaY: 8,
          ),
          child: FadeTransition(
            opacity: anim1,
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: child,
              ),
            ),
          ),
        ),
        context: context,
      );

  static Future<void> showWarningDialog(
    BuildContext context, {
    required String title,
    required String message,
    required Function(BuildContext) onConfirm,
    required Function(BuildContext) onReject,
    bool isDelete = true,
    double maxWidth = 800,
    bool barrierDismissible = true,
    Key? key,
  }) =>
      showGeneralDialog(
        barrierDismissible: barrierDismissible,
        barrierLabel: '',
        barrierColor: AppBaseColors.darkSurfaceColors,
        pageBuilder: (ctx, anim1, anim2) {
          return CustomDialog(
            key: key,
            isWarning: isDelete,
            title: title,
            message: message,
            onConfirm: onConfirm,
            maxWidth: maxWidth,
            onReject: onReject,
          );
        },
        transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 8,
            sigmaY: 8,
          ),
          child: FadeTransition(
            opacity: anim1,
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: child,
              ),
            ),
          ),
        ),
        context: context,
      );

  static Future<void> showPrimaryDialog(
    BuildContext context, {
    required String title,
    required String message,
    required Function(BuildContext) onConfirm,
    required Function(BuildContext) onReject,
    IconData? icon,
    bool barrierDismissible = true,
    double maxWidth = 800,
  }) =>
      showGeneralDialog(
        barrierDismissible: barrierDismissible,
        barrierLabel: '',
        barrierColor: AppBaseColors.darkSurfaceColors,
        pageBuilder: (ctx, anim1, anim2) {
          return CustomDialog(
            isWarning: false,
            title: title,
            message: message,
            onConfirm: onConfirm,
            confirmIcon: icon ?? Icons.check,
            maxWidth: maxWidth,
            onReject: onReject,
          );
        },
        transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 8,
            sigmaY: 8,
          ),
          child: FadeTransition(
            opacity: anim1,
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: child,
              ),
            ),
          ),
        ),
        context: context,
      );

  static Future<void> showBlurred(
    BuildContext context,
    Widget child, {
    bool barrierDismissible = true,
  }) =>
      showGeneralDialog(
        barrierDismissible: barrierDismissible,
        barrierLabel: '',
        barrierColor: AppBaseColors.darkSurfaceColors,
        pageBuilder: (ctx, anim1, anim2) => child,
        transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 8 * anim1.value,
            sigmaY: 8 * anim1.value,
          ),
          child: FadeTransition(
            opacity: anim1,
            child: child,
          ),
        ),
        context: context,
      );

  static Future<DateTime?> showBlurredDatePicker({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    DateTime? currentDate,
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
    SelectableDayPredicate? selectableDayPredicate,
    String? helpText,
    String? cancelText,
    String? confirmText,
    Locale? locale,
    bool useRootNavigator = true,
    TextDirection? textDirection,
    DatePickerMode initialDatePickerMode = DatePickerMode.day,
    String? errorFormatText,
    String? errorInvalidText,
    String? fieldHintText,
    String? fieldLabelText,
  }) async {
    assert(context != null);
    assert(initialDate != null);
    assert(firstDate != null);
    assert(lastDate != null);
    initialDate = DateUtils.dateOnly(initialDate);
    firstDate = DateUtils.dateOnly(firstDate);
    lastDate = DateUtils.dateOnly(lastDate);
    assert(
      !lastDate.isBefore(firstDate),
      'lastDate $lastDate must be on or after firstDate $firstDate.',
    );
    assert(
      !initialDate.isBefore(firstDate),
      'initialDate $initialDate must be on or after firstDate $firstDate.',
    );
    assert(
      !initialDate.isAfter(lastDate),
      'initialDate $initialDate must be on or before lastDate $lastDate.',
    );
    assert(
      selectableDayPredicate == null || selectableDayPredicate(initialDate),
      'Provided initialDate $initialDate must satisfy provided selectableDayPredicate.',
    );
    assert(initialEntryMode != null);
    assert(useRootNavigator != null);
    assert(initialDatePickerMode != null);
    assert(debugCheckHasMaterialLocalizations(context));

    Widget dialog = DatePickerDialog(
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      currentDate: currentDate,
      initialEntryMode: initialEntryMode,
      selectableDayPredicate: selectableDayPredicate,
      helpText: helpText,
      cancelText: cancelText,
      confirmText: confirmText,
      initialCalendarMode: initialDatePickerMode,
      errorFormatText: errorFormatText,
      errorInvalidText: errorInvalidText,
      fieldHintText: fieldHintText,
      fieldLabelText: fieldLabelText,
    );

    if (textDirection != null) {
      dialog = Directionality(
        textDirection: textDirection,
        child: dialog,
      );
    }

    if (locale != null) {
      dialog = Localizations.override(
        context: context,
        locale: locale,
        child: dialog,
      );
    }

    return showDialogBlurred<DateTime>(context, dialog);
  }
}
