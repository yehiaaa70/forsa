part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginAuthLoading extends LoginState {}
class LoginAuthLoaded extends LoginState {}
class LoginAuthError extends LoginState {}
