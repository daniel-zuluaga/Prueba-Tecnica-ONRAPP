import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:prueba_tecnica_orn/core/config/helpers/injector/injector.dart';
import 'package:prueba_tecnica_orn/core/router/routes.dart';
import 'package:prueba_tecnica_orn/mutli_provider_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  Injector.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext context, Orientation orientation,
          ScreenType screenType) {
        return GlobalLoaderOverlay(
          overlayWidgetBuilder: (progress) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white.withOpacity(0.6),
              child: const Center(
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: SpinKitSpinningLines(
                    color: Colors.black,
                    lineWidth: 5,
                  ),
                ),
              ),
            );
          },
          child: PTMultiBlocProvider(
            child: MaterialApp.router(
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
              ),
              title: 'App',
              debugShowCheckedModeBanner: false,
              routeInformationParser: router.routeInformationParser,
              routerDelegate: router.routerDelegate,
              routeInformationProvider: router.routeInformationProvider,
            ),
          ),
        );
      },
    );
  }
}
