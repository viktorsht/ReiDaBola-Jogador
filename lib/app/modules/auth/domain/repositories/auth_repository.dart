import '../entities/create_user.dart';
import '../entities/login.dart';
import '../entities/token.dart';

abstract class AuthRepository{
  Future<Token> createUser(CreateUser user);
  Future<Token> login(Login login);
  //Future<Token> refreshToken(Refresh refresh);
  //Future<User> myUser();
  //Future<String?> interception();
  //Future<String?> checkForUpdate();
}
