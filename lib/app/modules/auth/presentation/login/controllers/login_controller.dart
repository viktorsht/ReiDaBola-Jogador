import 'package:core_kb/core_kb.dart';
import '../../../domain/entities/login.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../../domain/repositories/token_repository.dart';
import '../states/login_state.dart';

class LoginController extends Notifier<BaseState>{

  final AuthRepository authRepository;
  final TokenRepository tokenRepository;

  LoginController(this.authRepository, this.tokenRepository) : super(LoginInitial());



  Future<void> login(Login entity) async {
    setState(LoginLoading());
    try{
      final data = await authRepository.login(entity);
      if(data.access == null){
        setState(LoginError(error: 'Erro no login'));
      }
      else{
        setState(LoginSucess(data: data));
        tokenRepository.saveToken(data.access.toString());
        //tokenRepository.saveRefreshToken(data.refresh.toString());
      }
    }
    catch (e){
      setState(LoginError(error: e.toString()));
    }
  }


}