abstract class AnalyticsEvent {
  final String key;
  final Map<String, dynamic>? properties;

  AnalyticsEvent(this.key, this.properties);
}
