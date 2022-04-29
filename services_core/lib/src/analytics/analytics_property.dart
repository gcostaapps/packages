abstract class AnalyticsProperty {
  final Map<String, dynamic> property;
  AnalyticsProperty(this.property);
}

abstract class AnalyticsIncrementProperty {
  final String key;
  AnalyticsIncrementProperty(this.key);
}
