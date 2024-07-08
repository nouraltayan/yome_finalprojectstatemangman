part of 'atherbloc.dart';

abstract class AuthState {}

class Authitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authsccsess extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class Authfil extends AuthState {
  final String message;

  Authfil(this.message);
}
