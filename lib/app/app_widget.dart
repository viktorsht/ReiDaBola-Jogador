import 'package:core_kb/core_kb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:babigol/babigol.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget{
  const AppWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
      return ChangeNotifierProvider(
      create: (context) => ThemeController(),
      child: Consumer<ThemeController>(
        builder: (context, controller, child) {
          return MaterialApp.router(
            theme: controller.isDarkMode ? darkTheme(context) : lightTheme(context),
            //theme: lightTheme(context),
            debugShowCheckedModeBanner: false,
            routerConfig: Modular.routerConfig,
          );
        }
      )
    );
  }
}

      /*
class AppWidget extends StatelessWidget{
  const AppWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
          return MaterialApp.router(
            //theme: controller.isDarkMode ? darkTheme(context) : lightTheme(context),
            theme: lightTheme(context),
            debugShowCheckedModeBanner: false,
            routerConfig: Modular.routerConfig,
          );
      return Consumer<ThemeController>(
        builder: (context, controller, child) {
        }
      );
      
      
  }
}
      */