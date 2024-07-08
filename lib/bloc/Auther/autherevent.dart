part of 'atherbloc.dart';

sealed class AuthEvent {}

class Singupbottom extends AuthEvent {
  final Usermodel user;

  Singupbottom(this.user);
}

class Logoutbottom extends AuthEvent {}

class Loginbutton extends AuthEvent {
  final Userloginmodel user;

  Loginbutton(this.user);
}
