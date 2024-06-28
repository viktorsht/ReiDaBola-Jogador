import '../../domain/entities/login.dart';
import '../../domain/entities/token.dart';

abstract class AuthDataSource {
  //Future<User> createUser(CreateUser user);
  Future<Token> login(Login login);
  //Future<Token> refreshToken(Refresh refresh);
  //Future<User> myUser(String token);
  //Future<int> interception(String token);
  //Future<String> checkForUpdate();

}