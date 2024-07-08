part of 'projectbloc.dart';

abstract class ProjectState {}

class Projectitial extends ProjectState {}

class ProjectLoading extends ProjectState {}

class Projectsccsess extends ProjectState {}

class ProjectError extends ProjectState {
  final String message;

  ProjectError(this.message);
}

class Projectfil extends ProjectState {
  final String message;

  Projectfil(this.message);
}

class Projectsccsessid extends ProjectState {
  final String message;

  Projectsccsessid(this.message);
}
