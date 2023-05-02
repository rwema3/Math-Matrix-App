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
}

class MyApp extends StatelessWidget {
  final String fontFamily = "Montserrat";

  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Math Matrix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: Color(0xFFaa0000),
          brightness: Brightness.dark,
            button:
                TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w500),
          )),
      builder: (context, widget) => Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(
                  child: widget,
                )),
      ),
      navigatorKey: GetIt.I<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: KeyUtil.Dashboard,
      home: DashboardView(),
    );
  }
}
