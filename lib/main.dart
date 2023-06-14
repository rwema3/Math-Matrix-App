import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:mathgame/src/ui/dashboard/dashboard_view_model.dart';
import 'package:mathgame/src/service/dialog_service.dart';
import 'package:mathgame/src/service/navigation_service.dart';
import 'package:mathgame/src/core/router.dart';
import 'package:mathgame/src/ui/dashboard/dashboard_view.dart';
import 'package:mathgame/src/ui/common/dialog_manager.dart';
import 'package:mathgame/src/core/app_constant.dart';

void main() {
  setupServiceLocator();
  runApp(MyApp());
}

setupServiceLocator() {
  GetIt.I.registerLazySingleton(() => NavigationService());
  GetIt.I.registerSingleton<DashboardViewModel>(DashboardViewModel());
  GetIt.I.registerLazySingleton(() => DialogService());
