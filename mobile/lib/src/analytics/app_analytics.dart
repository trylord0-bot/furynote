import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';

abstract class AppAnalytics {
  Future<void> logScreenView(
    String screenName, {
    String? screenClass,
    Map<String, Object>? parameters,
  });

  Future<void> logEvent(String name, {Map<String, Object>? parameters});
}

class NoopAppAnalytics implements AppAnalytics {
  const NoopAppAnalytics();

  @override
  Future<void> logEvent(String name, {Map<String, Object>? parameters}) async {}

  @override
  Future<void> logScreenView(
    String screenName, {
    String? screenClass,
    Map<String, Object>? parameters,
  }) async {}
}

class FirebaseAppAnalytics implements AppAnalytics {
  FirebaseAppAnalytics(this._analytics);

  static final FirebaseAppAnalytics instance = FirebaseAppAnalytics(
    FirebaseAnalytics.instance,
  );

  final FirebaseAnalytics _analytics;

  @override
  Future<void> logScreenView(
    String screenName, {
    String? screenClass,
    Map<String, Object>? parameters,
  }) {
    return _analytics.logScreenView(
      screenName: screenName,
      screenClass: screenClass,
      parameters: parameters,
    );
  }

  @override
  Future<void> logEvent(String name, {Map<String, Object>? parameters}) {
    return _analytics.logEvent(name: name, parameters: parameters);
  }
}

class AppAnalyticsRouteObserver extends NavigatorObserver {
  AppAnalyticsRouteObserver(this.analytics);

  final AppAnalytics analytics;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _track(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null) {
      _track(newRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute != null) {
      _track(previousRoute);
    }
  }

  void _track(Route<dynamic> route) {
    final name = route.settings.name;
    if (name == null || name.isEmpty || name == '/') {
      return;
    }
    unawaited(
      analytics.logScreenView(name, screenClass: route.runtimeType.toString()),
    );
  }
}
