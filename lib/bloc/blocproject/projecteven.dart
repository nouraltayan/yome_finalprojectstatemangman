part of 'projectbloc.dart';

sealed class ProjectEvent {}

class NewprojectButtonPressed extends ProjectEvent {
  final Projcetmodel proje;

  NewprojectButtonPressed(this.proje);
}

class NewtaskButtonPressed extends ProjectEvent {}

class Newgetpriject extends ProjectEvent {
  final Projcetmodel proje;

  Newgetpriject(this.proje);
}

class deletproject extends ProjectEvent {}
