part of 'taskbloc.dart';

abstract class taskState {}

class taskInitial extends taskState {}

class taskLoading extends taskState {}

class tasksccsess extends taskState {}

class taskError extends taskState {
  final String message;

  taskError(this.message);
}

class taskfil extends taskState {
  final String message;

  taskfil(this.message);
}
