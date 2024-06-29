import 'package:core_kb/core_kb.dart';

final class CreateUserInitial extends BaseState {}

class CreateUserError extends BaseState {
  final String error;

  CreateUserError({required this.error});
}

class CreateUserSucess extends BaseState {}

class CreateUserLoading extends BaseState {}