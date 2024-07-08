// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:project_management/model/handling.dart';
part 'modelgetproject.g.dart';

@HiveType(typeId: 0)
class getProjcetmodel extends ResultModel {
  @HiveField(0)
  final num id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  getProjcetmodel({
    required this.id,
    required this.name,
    required this.description,
  });

  getProjcetmodel copyWith({
    num? id,
    String? name,
    String? description,
  }) {
    return getProjcetmodel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory getProjcetmodel.fromMap(Map<String, dynamic> map) {
    return getProjcetmodel(
      id: map['id'] as num,
      name: map['name'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory getProjcetmodel.fromJson(String source) =>
      getProjcetmodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'getProjcetmodel(id: $id, name: $name, description: $description)';

  @override
  bool operator ==(covariant getProjcetmodel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}
