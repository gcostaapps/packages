// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import 'i_logger.dart';

class ProductionFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

class AppLogger implements ILogger {
  late Logger _logger;

  AppLogger(this.releaseExceptionCatcher) {
    var release = true;
    assert(() {
      release = false;
      return true;
    }());
    _logger = Logger(filter: ProductionFilter());
  }

  final List<String> messages = [];

  final Function(dynamic message, {dynamic hint, StackTrace? stackTrace})?
      releaseExceptionCatcher;

  @override
  void debug(dynamic message, {dynamic error, StackTrace? stackTrace}) =>
      kDebugMode
          ? _logger.d(message, error: error, stackTrace: stackTrace)
          : null;

  @override
  void error(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      _logger.e(message, error: error, stackTrace: stackTrace);
    } else if (kReleaseMode && releaseExceptionCatcher != null) {
      releaseExceptionCatcher!(
        error,
        hint: message,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  void info(dynamic message, {dynamic error, StackTrace? stackTrace}) =>
      kDebugMode
          ? _logger.i(message, error: error, stackTrace: stackTrace)
          : null;

  @override
  void warning(dynamic message, {dynamic error, StackTrace? stackTrace}) =>
      kDebugMode
          ? _logger.w(message, error: error, stackTrace: stackTrace)
          : null;

  @override
  void append(String message) => messages.add(message);

  @override
  void closeAppend() {
    info(messages.join('\n'));
    messages.clear();
  }
}
