// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:project_management/model/handling.dart';

class Userloginmodel extends ResultModel {
  final String email;
  final String password;
  Userloginmodel({
    required this.email,
    required this.password,
  });

  Userloginmodel copyWith({
    String? email,
    String? password,
  }) {
    return Userloginmodel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory Userloginmodel.fromMap(Map<String, dynamic> map) {
    return Userloginmodel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Userloginmodel.fromJson(String source) =>
      Userloginmodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Userloginmodel(email: $email, password: $password)';

  @override
  bool operator ==(covariant Userloginmodel other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
