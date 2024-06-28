import 'package:app/app/routes/route_navigator.dart';
import 'package:core_kb/core_kb.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../routes/app_routes.dart';
import '../auth/auth_module.dart';
import 'pages/splash_page.dart';

class SplashModule extends Module{
  @override
  List<Module> get imports => [CoreModule(), AuthModule()];
  
  @override
  void binds(i) {
    //i.add(SplashController.new);
  }

  @override
  void routes(r){
    r.child(AppRoutes.root, child: (context) => SplashPage(route: RouteNavigator(),));

    /*r.child(AppRoutes.notInternet, child: (context) => NoInternetWidget(
      onPressed: () => Modular.to.navigate(AppRoutes.splashModule)
    ));*/
  }
}