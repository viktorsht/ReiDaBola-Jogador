import 'dart:convert';

import 'package:core_kb/api/headers.dart';
import 'package:core_kb/http/http_client.dart';

import '../../../../../external/routes.dart';
import '../../../domain/entities/create_user.dart';
import '../../../domain/entities/login.dart';
import '../../../domain/entities/token.dart';
import '../auth_datasource.dart';

class AuthDataSourceImpl implements AuthDataSource{
  
  final ClientHttp service;
  final Headers headers;

  AuthDataSourceImpl(this.service, this.headers);

  @override
  Future<Token> createUser(CreateUser user) async {
    final response = await service.post(RoutesApi.createUser, HeadersApi.getHeaders(), user.toJson());
    final json = jsonDecode(response.body);
    return Token.fromJson(json);
  }
  /*

  @override
  Future<int> interception(String token) async {
    final response = await service.get(RoutesApi.myUser, headers.headersToken(token));
    return response.statusCode;
  }*/

  @override
  Future<Token> login(Login login) async {
    final response = await service.post(RoutesApi.login, HeadersApi.getHeaders(), login.toJson());
    final json = jsonDecode(response.body);
    return Token.fromJson(json);
  }
/*
  @override
  Future<User> myUser(String token) async {
    final response = await service.get(RoutesApi.myUser, headers.headersToken(token));
    if(response.statusCode == 401){
      throw UnauthorizedException('Você não está logado');
    }
    final json = jsonDecode(utf8.decode(response.bodyBytes)); // resolve acentuação
    return User.fromJson(json);
  }

  @override
  Future<Token> refreshToken(Refresh refresh) async {
    final response = await service.post(RoutesApi.refreshToken, HeadersApi.getHeaders(), refresh.toJson());
    final json = jsonDecode(response.body);
    return Token.fromJson(json);
  }
  
  @override
  Future<String> checkForUpdate() async {
    final response = await service.get(RoutesApi.versionApp, HeadersApi.getHeaders());
    final json = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    return json[0]['version'];
  }
*/
}