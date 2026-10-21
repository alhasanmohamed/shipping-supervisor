import 'package:shipping_user_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

class NavObserver extends NavigatorObserver {
  NavObserver._();

  static final NavObserver _instance = NavObserver._();
  static NavObserver get instance => _instance;

  List<String> pages = [];

  @override
  void didPop(Route route, Route? previousRoute) {
    if(route.settings.name != null && pages.isNotEmpty){
      pages.remove(route.settings.name);
      '${route.settings.name!} popped'.redDebugPrint();
    }
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    if(route.settings.name != null){
      pages.add(route.settings.name!);
      '${route.settings.name!} pushed'.blueDebugPrint();
    }
    super.didPush(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    if(route.settings.name != null && pages.isNotEmpty){
      pages.remove(route.settings.name);
    }
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if(oldRoute != null && pages.isNotEmpty){
      pages.remove(oldRoute.settings.name);
    }
    if(newRoute != null && newRoute.settings.name != null){
      pages.add(newRoute.settings.name!);
    }
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
