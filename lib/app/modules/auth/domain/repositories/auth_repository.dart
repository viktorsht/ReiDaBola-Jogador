import '../entities/login.dart';
import '../entities/token.dart';

abstract class AuthRepository{
  //Future<User> createUser(CreateUser user);
  Future<Token> login(Login login);
  //Future<Token> refreshToken(Refresh refresh);
  //Future<User> myUser();
  //Future<String?> interception();
  //Future<String?> checkForUpdate();
}
