// signup_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:project_management/model/handling.dart';
import 'package:project_management/model/project/projectmodel.dart';
import 'package:project_management/servivc/Projectservice.dart';

part 'projecteven.dart';
part 'projectstate.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(Projectitial()) {
    on<NewprojectButtonPressed>((event, emit) async {
      emit(ProjectLoading());

      ResultModel result = await proServiceImp().newproject(event.proje);

      if (result is SuccessModel) {
        emit(Projectsccsess());
      } else if (result is ErrorModel) {
        emit(ProjectError("error Error alredy have"));
      } else if (result is ExceptionModel) {
        emit(Projectfil("error Exception internet"));
      }
    });
    on<Newgetpriject>((event, emit) async {
      emit(ProjectLoading());

      ResultModel result = await proServiceImp().getProject();

      if (result is SuccessModel) {
        emit(Projectsccsess());
      } else if (result is ErrorModel) {
        emit(ProjectError("error Error alredy have"));
      } else if (result is ExceptionModel) {
        emit(Projectfil("error Exception internet"));
      }
    });

    on<deletproject>((event, emit) async {
      emit(ProjectLoading());

      ResultModel result = await proServiceImp().deletproject();

      if (result is SuccessModel) {
        emit(Projectsccsess());
      } else if (result is ErrorModel) {
        emit(ProjectError("error Error alredy have"));
      } else if (result is ExceptionModel) {
        emit(Projectfil("error Exception internet"));
      }
    });
  }
}
