import 'dart:convert';

import 'package:hive/hive.dart';

import '../handling.dart';
part 'tokenmodel.g.dart';

@HiveType(typeId: 2)
class tokenmodel extends ResultModel {
  @HiveField(0)
  final String access_token;
  @HiveField(1)
  final String refresh_token;
  tokenmodel({
    required this.access_token,
    required this.refresh_token,
  });

  tokenmodel copyWith({
    String? access_token,
    String? refresh_token,
  }) {
    return tokenmodel(
      access_token: access_token ?? this.access_token,
      refresh_token: refresh_token ?? this.refresh_token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': access_token,
      'refresh_token': refresh_token,
    };
  }

  factory tokenmodel.fromMap(Map<String, dynamic> map) {
    return tokenmodel(
      access_token: map['access_token'] as String,
      refresh_token: map['refresh_token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory tokenmodel.fromJson(String source) =>
      tokenmodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'tokenmodel(access_token: $access_token, refresh_token: $refresh_token)';

  @override
  bool operator ==(covariant tokenmodel other) {
    if (identical(this, other)) return true;

    return other.access_token == access_token &&
        other.refresh_token == refresh_token;
  }

  @override
  int get hashCode => access_token.hashCode ^ refresh_token.hashCode;
}
