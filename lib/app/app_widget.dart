import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:babigol/babigol.dart';

class AppWidget extends StatelessWidget{
  const AppWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme(context),
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
    );
  }

}