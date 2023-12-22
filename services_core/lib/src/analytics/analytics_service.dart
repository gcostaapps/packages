import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

import '../device_info/device_info.dart';
import 'analytics_event.dart';
import 'analytics_property.dart';
import 'i_analytics_service.dart';

class AnalyticsService implements IAnalyticsService {
  final String? mixpanelToken;

  Mixpanel? _mixpanel;
  late FirebaseAnalytics _firebase;

  AnalyticsService({this.mixpanelToken}) {
    if (DeviceOS.isMobile || DeviceOS.isWeb) {
      _firebase = FirebaseAnalytics.instance;
      initMixPanel();
    }
  }

  Future<void> initMixPanel() async {
    if (mixpanelToken != null) {
      _mixpanel = await Mixpanel.init(
        mixpanelToken!,
        trackAutomaticEvents: true,
      );
    }
  }

  @override
  Future<void> logUser(String userId) async {
    if (DeviceOS.isMobile) {
      await _firebase.setUserId(id: userId);
      _mixpanel?.identify(userId);
    }
  }

  @override
  Future<void> logEvent(AnalyticsEvent event) async {
    if (DeviceOS.isMobile) {
      await _firebase.logEvent(name: event.key, parameters: event.properties);
      _mixpanel?.track(event.key, properties: event.properties ?? {});
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
      _mixpanel?.registerSuperProperties(property.property);
    }
  }

  @override
  Future<void> incrementUserProperty(
      AnalyticsIncrementProperty property) async {
    final properties = await _mixpanel?.getSuperProperties();
    if (properties != null && properties.containsKey(property.key)) {
      _mixpanel?.registerSuperProperties(
        {property.key: properties[property.key]! + 1},
      );
      return;
    }
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
