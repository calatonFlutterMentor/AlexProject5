import 'package:flutter/material.dart';

import 'inavigation_util.dart';

class NavigationUtil implements INavigationUtil {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final NavigationUtil _instance = NavigationUtil._();

  factory NavigationUtil() {
    return _instance;
  }

  NavigationUtil._();

  @override
  bool get canPop => navigatorKey.currentState!.canPop();

  @override
  void navigateBack({data}) {
    return navigatorKey.currentState!.pop(data);
  }

  @override
  void navigateBackToStart() {
    // TODO: implement navigateBackToStart
  }

  @override
  void navigateBackUntilNamed(String named) {

  }

  @override
  Future navigateTo<T extends Object?>(String routeName,
      {bool allowBackNavigation = true, data}) {
    return navigatorKey.currentState!.pushNamed(routeName,arguments: data);
  }

  @override
  Future navigateToAndMakeRoot<T extends Object?>(String routeName, {data}) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }
}
