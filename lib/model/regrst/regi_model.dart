// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:project_management/model/handling.dart';

class Usermodel extends ResultModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String role;
  Usermodel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.role,
  });

  Usermodel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? role,
  }) {
    return Usermodel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'role': role,
    };
  }

  factory Usermodel.fromMap(Map<String, dynamic> map) {
    return Usermodel(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Usermodel.fromJson(String source) =>
      Usermodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Usermodel(firstName: $firstName, lastName: $lastName, email: $email, password: $password, role: $role)';
  }

  @override
  bool operator ==(covariant Usermodel other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.password == password &&
        other.role == role;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        password.hashCode ^
        role.hashCode;
  }
}
