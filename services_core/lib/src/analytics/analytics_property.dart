// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

abstract class AnalyticsProperty {
  final Map<String, dynamic> property;
  AnalyticsProperty(this.property);

  @override
  bool operator ==(covariant AnalyticsProperty other) {
    if (identical(this, other)) return true;

    return mapEquals(other.property, property);
  }

  @override
  int get hashCode => property.hashCode;
}

abstract class AnalyticsIncrementProperty {
  final String key;
  AnalyticsIncrementProperty(this.key);

  @override
  bool operator ==(covariant AnalyticsIncrementProperty other) {
    if (identical(this, other)) return true;

    return other.key == key;
  }

  @override
  int get hashCode => key.hashCode;
}
