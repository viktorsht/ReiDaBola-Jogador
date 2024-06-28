import '../../domain/repositories/token_repository.dart';
import '../datasources/token_datasource.dart';

class TokenRepositoryImpl extends TokenRepository {

  final TokenDatasource tokenDatasource;


  TokenRepositoryImpl(this.tokenDatasource);

  @override
  Future<void> saveToken(String token) async {
    await tokenDatasource.saveToken(token);
  }

  @override
  Future<void> saveRefreshToken(String refreshToken) async {
    await tokenDatasource.saveRefreshToken(refreshToken);
  }

  @override
  Future<String?> getToken() async {
    final token = await tokenDatasource.getToken();
    return token;
  }

  @override
  Future<String?> getRefreshToken() async {
    return await tokenDatasource.getRefreshToken();
  }

  @override
  Future<void> deleteToken() async {
    await tokenDatasource.deleteToken();
  }

  @override
  Future<void> deleteRefreshToken() async {
    await tokenDatasource.deleteRefreshToken();
  }

  @override
  Future<void> deleteAll() async {
    await tokenDatasource.deleteAll();
  }

}