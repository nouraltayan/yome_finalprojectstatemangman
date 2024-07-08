// signup_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:project_management/model/handling.dart';
import 'package:project_management/servivc/Projectservice.dart';

part 'taskevent.dart';
part 'taskstate.dart';

class taskBloc extends Bloc<taskEvent, taskState> {
  taskBloc() : super(taskInitial()) {
    on<taskButtonPressed>((event, emit) async {
      emit(taskLoading());

      ResultModel result = await proServiceImp().newtask(event.task);

      if (result is SuccessModel) {
        emit(tasksccsess());
      } else if (result is ErrorModel) {
        emit(taskError("error Error alredy have"));
      } else if (result is ExceptionModel) {
        emit(taskfil("error Exception internet"));
      }
    });
  }
}
