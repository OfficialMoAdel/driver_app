part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterInitial extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterFaliure extends AuthState {
  String errMassge;
  RegisterFaliure({required this.errMassge});
}

class LoginInitial extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginLoading extends AuthState {}

class LoginFaliure extends AuthState {
  String errMassge;
  LoginFaliure({required this.errMassge});
}
