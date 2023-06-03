import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:mixpanel_analytics/mixpanel_analytics.dart';

import '../device_info/device_info.dart';
import '../logger/i_logger.dart';
import 'analytics_event.dart';
import 'analytics_property.dart';
import 'i_analytics_service.dart';

class AnalyticsService implements IAnalyticsService {
  final ILogger _logger;
  final String? mixpanelToken;

  MixpanelAnalytics? _mixpanel;
  late FirebaseAnalytics _firebase;

  AnalyticsService(this._logger, {this.mixpanelToken}) {
    if (DeviceOS.isMobile) {
      _firebase = FirebaseAnalytics.instance;
      if (mixpanelToken != null) {
        _mixpanel = MixpanelAnalytics(
          token: mixpanelToken!,
          verbose: kDebugMode,
          onError: (e) => _logger.error('mixpanelAnalytics', error: e),
        );
      }
    }
  }

  @override
  Future<void> logUser(String userId) async {
    if (DeviceOS.isMobile) {
      await _firebase.setUserId(id: userId);
      _mixpanel?.userId = userId;
    }
  }

  @override
  Future<void> logEvent(AnalyticsEvent event) async {
    if (DeviceOS.isMobile) {
      await _firebase.logEvent(name: event.key, parameters: event.properties);
      await _mixpanel?.track(
          event: event.key, properties: event.properties ?? {});
    }
  }

  @override
  Future<void> logUserProperty(AnalyticsProperty property) async {
    if (DeviceOS.isMobile) {
      for (final userProp in property.property.entries) {
        await _firebase.setUserProperty(
          name: userProp.key,
          value: userProp.value.toString(),
        );
      }
      await _mixpanel?.engage(
        operation: MixpanelUpdateOperations.$set,
        value: property.property,
      );
    }
  }

  @override
  Future<void> incrementUserProperty(
      AnalyticsIncrementProperty property) async {
    await _mixpanel?.engage(
      operation: MixpanelUpdateOperations.$add,
      value: {property.key: 1},
    );
  }

  @override
  Future<void> setScreen(String screenName) async {
    if (DeviceOS.isMobile) {
      await _firebase.setCurrentScreen(screenName: screenName);
    }
  }

  @override
  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _firebase);
}
