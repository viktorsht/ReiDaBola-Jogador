import 'package:core_kb/core_kb.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/auth_page.dart';

class AuthModule extends Module{

  @override
  List<Module> get imports => [CoreModule(), AuthModule()];
  
  @override
  void binds(i) {
    //i.add(SplashController.new);
  }

  @override
  void routes(r){
    r.child('/', child: (context) => const AuthPage());

    /*r.child(AppRoutes.notInternet, child: (context) => NoInternetWidget(
      onPressed: () => Modular.to.navigate(AppRoutes.splashModule)
    ));*/
  }

}