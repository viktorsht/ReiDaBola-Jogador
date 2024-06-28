import 'package:app/app/modules/auth/presentation/createUser/pages/create_user_page.dart';
import 'package:app/app/routes/route_navigator.dart';
import 'package:core_kb/core_kb.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../routes/app_routes.dart';
import 'data/datasources/auth_datasource.dart';
import 'data/datasources/impl/auth_datasource_impl.dart';
import 'data/datasources/impl/token_datasource_impl.dart';
import 'data/datasources/token_datasource.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'data/repositories/token_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/repositories/token_repository.dart';
import 'presentation/auth_page.dart';
import 'presentation/login/controllers/login_controller.dart';
import 'presentation/login/pages/login_page.dart';

class AuthModule extends Module{

  @override
  List<Module> get imports => [CoreModule()];
  
  @override
  void binds(i) {
    i.add<AuthRepository>(AuthRepositoryImpl.new);
    i.add<AuthDataSource>(AuthDataSourceImpl.new);
    i.add<TokenDatasource>(TokenDataSourceImpl.new);
    i.add<TokenRepository>(TokenRepositoryImpl.new);
    i.add(LoginController.new);

  }

  @override
  void routes(r){
    r.child(AppRoutes.root, child: (context) => AuthPage(route: RouteNavigator(),));
    r.child(AppRoutes.login, child: (context) => LoginPage(controller: Modular.get(),));
    r.child(AppRoutes.createUser, child: (context) => CreateUserPage(controller: Modular.get(), route: RouteNavigator()));

    /*r.child(AppRoutes.notInternet, child: (context) => NoInternetWidget(
      onPressed: () => Modular.to.navigate(AppRoutes.splashModule)
    ));*/
  }

}