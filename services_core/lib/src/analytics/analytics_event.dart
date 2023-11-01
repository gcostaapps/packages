import 'package:flutter/foundation.dart';

abstract class AnalyticsEvent {
  final String key;
  final Map<String, dynamic>? properties;

  AnalyticsEvent(this.key, this.properties);

  @override
  bool operator ==(covariant AnalyticsEvent other) {
    if (identical(this, other)) return true;

    return other.key == key && mapEquals(other.properties, properties);
  }

  @override
  int get hashCode => key.hashCode ^ properties.hashCode;
}
