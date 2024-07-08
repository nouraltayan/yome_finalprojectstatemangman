// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:project_management/model/handling.dart';
part 'taskmodel.g.dart';

@HiveType(typeId: 1)
class Taskmodel extends ResultModel {
  @HiveField(0)
  final String taskDescription;
  @HiveField(1)
  final String taskStatus;
  @HiveField(2)
  final num project_id;
  Taskmodel({
    required this.taskDescription,
    required this.taskStatus,
    required this.project_id,
  });

  Taskmodel copyWith({
    String? taskDescription,
    String? taskStatus,
    num? project_id,
  }) {
    return Taskmodel(
      taskDescription: taskDescription ?? this.taskDescription,
      taskStatus: taskStatus ?? this.taskStatus,
      project_id: project_id ?? this.project_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'taskDescription': taskDescription,
      'taskStatus': taskStatus,
      'project_id': project_id,
    };
  }

  factory Taskmodel.fromMap(Map<String, dynamic> map) {
    return Taskmodel(
      taskDescription: map['taskDescription'] as String,
      taskStatus: map['taskStatus'] as String,
      project_id: map['project_id'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Taskmodel.fromJson(String source) =>
      Taskmodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Taskmodel(taskDescription: $taskDescription, taskStatus: $taskStatus, project_id: $project_id)';

  @override
  bool operator ==(covariant Taskmodel other) {
    if (identical(this, other)) return true;

    return other.taskDescription == taskDescription &&
        other.taskStatus == taskStatus &&
        other.project_id == project_id;
  }

  @override
  int get hashCode =>
      taskDescription.hashCode ^ taskStatus.hashCode ^ project_id.hashCode;
}
