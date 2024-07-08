part of 'taskbloc.dart';

sealed class taskEvent {}

class taskButtonPressed extends taskEvent {
  final List<Map<String, dynamic>> task;

  taskButtonPressed(this.task);
}
