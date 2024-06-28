import 'package:core_kb/cache/repositories/cache_repository.dart';

import '../../domain/entities/login.dart';
import '../../domain/entities/token.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/token_repository.dart';
import '../datasources/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository{
  
  final TokenRepository tokenRepository;
  final AuthDataSource authDataSource;
  final CacheRepository cacheRepository;

  AuthRepositoryImpl(this.tokenRepository, this.authDataSource, this.cacheRepository);

  /*@override
  Future<User> createUser(CreateUser user) async {
    try {
      return await authDataSource.createUser(user);
    } catch (e) {
      throw Exception(e);
    }
  }*/

  @override
  Future<Token> login(Login login) async {
    try {
      return await authDataSource.login(login);
    } catch (e) {
      throw Exception(e);
    }
  }
/*
  @override
  Future<Token> refreshToken(Refresh refresh) async {
    try {
      return await authDataSource.refreshToken(refresh);
    } catch (e) {
      throw UnauthorizedException(e.toString());
    }
  }

  @override
  Future<String?> interception() async{
    String? token = await tokenRepository.getToken();
    if(token == null){
      throw UnauthorizedException('Token nulo');
    }
    try{
      final response = await authDataSource.interception(token);
      if(response != 200){
        final refresh = await tokenRepository.getRefreshToken();
        final newAccess = await authDataSource.refreshToken(Refresh(refresh: refresh));
        if(newAccess.access == null || newAccess.refresh == null){
          throw UnauthorizedException('Token não atualizado');
        }
        await tokenRepository.saveToken(newAccess.access!);
        await tokenRepository.saveRefreshToken(newAccess.refresh!);
        
        return newAccess.access!;
      }
      return token;
    }
    catch(e){
      throw UnauthorizedException(e.toString());
    }
  }
  
  @override
  Future<User> myUser() async {
    try {
      final token = await interception();
      if(token == null){
        throw UnauthorizedException('Token nulo');
      }
      final user = await authDataSource.myUser(token);
      await cacheRepository.setData(params: CacheParams(key: 'user', value: user));
      return user;
    } catch(e){
      e is UnauthorizedException ? throw UnauthorizedException(e.toString()) : throw Exception(e);
    }
  }
  
  @override
  Future<String?> checkForUpdate() async {
    try {
      return await authDataSource.checkForUpdate();
    } catch(e){
      e is UnauthorizedException ? throw UnauthorizedException(e.toString()) : throw Exception(e);
    }
  }*/
}