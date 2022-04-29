import 'package:firebase_analytics/firebase_analytics.dart';

import 'analytics_event.dart';
import 'analytics_property.dart';

abstract class IAnalyticsService {
  Future<void> logEvent(AnalyticsEvent event);
  Future<void> setScreen(String screenName);
  Future<void> logUserProperty(AnalyticsProperty property);
  Future<void> incrementUserProperty(AnalyticsIncrementProperty property);
  Future<void> logUser(String userId);
  FirebaseAnalyticsObserver getAnalyticsObserver();
}
