import 'package:core_kb/core_kb.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../routes/app_routes.dart';
import 'presentation/auth_page.dart';

class AuthModule extends Module{

  @override
  List<Module> get imports => [CoreModule()];
  
  @override
  void binds(i) {
    //i.add(SplashController.new);
  }

  @override
  void routes(r){
    r.child(AppRoutes.root, child: (context) => const AuthPage());

    /*r.child(AppRoutes.notInternet, child: (context) => NoInternetWidget(
      onPressed: () => Modular.to.navigate(AppRoutes.splashModule)
    ));*/
  }

}