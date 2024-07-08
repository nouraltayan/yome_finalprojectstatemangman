import 'dart:convert';

import 'package:project_management/model/handling.dart';

class Projcetmodel extends ResultModel {
  final String projectName;
  final String projectDescription;
  final String projectStatus;
  Projcetmodel({
    required this.projectName,
    required this.projectDescription,
    required this.projectStatus,
  });

  Projcetmodel copyWith({
    String? projectName,
    String? projectDescription,
    String? projectStatus,
  }) {
    return Projcetmodel(
      projectName: projectName ?? this.projectName,
      projectDescription: projectDescription ?? this.projectDescription,
      projectStatus: projectStatus ?? this.projectStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'projectName': projectName,
      'projectDescription': projectDescription,
      'projectStatus': projectStatus,
    };
  }

  factory Projcetmodel.fromMap(Map<String, dynamic> map) {
    return Projcetmodel(
      projectName: map['projectName'] as String,
      projectDescription: map['projectDescription'] as String,
      projectStatus: map['projectStatus'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Projcetmodel.fromJson(String source) =>
      Projcetmodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Usermodel(projectName: $projectName, projectDescription: $projectDescription, projectStatus: $projectStatus)';

  @override
  bool operator ==(covariant Projcetmodel other) {
    if (identical(this, other)) return true;

    return other.projectName == projectName &&
        other.projectDescription == projectDescription &&
        other.projectStatus == projectStatus;
  }

  @override
  int get hashCode =>
      projectName.hashCode ^
      projectDescription.hashCode ^
      projectStatus.hashCode;
}
