import 'package:core_kb/core_kb.dart';
import '../../../domain/entities/create_user.dart';
import '../../../domain/repositories/auth_repository.dart';
import 'create_user_state.dart';

class CreateUserController extends Notifier<BaseState>{

  final AuthRepository authRepository;

  CreateUserController(this.authRepository) : super(CreateUserInitial());

  Future<void> createUser(CreateUser entity) async {
    setState(CreateUserLoading());
    try{
      await authRepository.createUser(entity);
      setState(CreateUserSucess());
    }
    catch (e){
      setState(CreateUserError(error: e.toString()));
    }
  }
}