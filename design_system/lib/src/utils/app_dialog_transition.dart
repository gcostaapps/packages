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
    required VoidCallback onConfirm,
    bool isDelete = true,
  }) =>
      showGeneralDialog(
        barrierDismissible: true,
        barrierLabel: '',
        barrierColor: AppBaseColors.darkSurfaceColors,
        pageBuilder: (ctx, anim1, anim2) {
          return Container(
            key: const ValueKey('WarningDialog'),
            width: MediaQuery.of(ctx).size.width - 32,
            decoration: BoxDecoration(
              color: ctx.colorScheme.surface,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SpacerHeight24,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    title.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: ctx.textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: ctx.colorScheme.error,
                    ),
                  ),
                ),
                SpacerHeight16,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                  ),
                ),
                SpacerHeight8,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () => Navigator.pop(ctx),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Icon(
                              Icons.close,
                              color: ctx.colorScheme.onBackground,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          key: const ValueKey('WarningDialogConfirmButton'),
                          onTap: onConfirm,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Icon(
                              isDelete
                                  ? Icons.delete_outline_rounded
                                  : Icons.check,
                              color: ctx.colorScheme.error,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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

  static Future<void> showAppLoading(BuildContext context) => showBlurred(
        context,
        CustomLoading(color: Theme.of(context).colorScheme.onSurface),
        barrierDismissible: false,
      );

  static Future<void> showBlurred(
    BuildContext context,
    Widget child, {
    bool barrierDismissible = true,
  }) =>
      showGeneralDialog(
        barrierDismissible: barrierDismissible,
        barrierLabel: '',
        barrierColor: AppBaseColors.darkSurfaceColors.withOpacity(0.5),
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
