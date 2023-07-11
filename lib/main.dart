import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/presentation/controller.dart/bloc_observer.dart';
import 'package:movie_hub/core/resources/router.dart';
import 'package:movie_hub/core/resources/theme.dart';
import 'package:movie_hub/core/services/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            routeInformationProvider: AppRouter.router.routeInformationProvider,
            routeInformationParser: AppRouter.router.routeInformationParser,
            routerDelegate: AppRouter.router.routerDelegate,
            // routerConfig: AppRouterStatefull.router,
            title: 'Flutter Demo',
            theme: getAppTheme(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
