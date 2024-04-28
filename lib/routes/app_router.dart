
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/UI/Homepage.dart';
import 'package:hello_world/UI/SettingPage.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

 @override
 List<AutoRoute> get routes => [
   /// routes go here
   AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: SettingRoute.page),
 ];
}