import 'package:core_kb/core_kb.dart';

import '../../../domain/entities/token.dart';

final class LoginInitial extends BaseState {}

class LoginError extends BaseState {
  final String error;

  LoginError({required this.error});
}

class LoginSucess extends BaseState {
  final Token data;

  LoginSucess({required this.data});
}

class LoginLoading extends BaseState {
  LoginLoading();
}