// signup_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:project_management/model/handling.dart';
import 'package:project_management/model/regrst/login.dart';
import 'package:project_management/model/regrst/regi_model.dart';
import 'package:project_management/model/token/tokenmodel.dart';
import 'package:project_management/servivc/Userservice.dart';

part 'autherevent.dart';
part 'autherstate.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Authitial()) {
    on<Singupbottom>((event, emit) async {
      emit(AuthLoading());

      ResultModel result = await UserServiceImp().singup(event.user);

      if (result is tokenmodel) {
        emit(Authsccsess());
      } else if (result is ErrorModel) {
        emit(AuthError("error Error alredy have"));
      } else if (result is ExceptionModel) {
        emit(Authfil("error Exception internet"));
      }
    });

    on<Loginbutton>((event, emit) async {
      emit(AuthLoading());
      ResultModel result = await UserServiceImp().login(event.user);
      if (result is tokenmodel) {
        emit(Authsccsess());
      } else if (result is ErrorModel) {
        emit(AuthError("error Error alredy have"));
      } else if (result is ExceptionModel) {
        emit(Authfil("error Exception internet"));
      }
    });

    on<Logoutbottom>((event, emit) async {
      emit(AuthLoading());
      ResultModel result = await UserServiceImp().logout();

      if (result is SuccessModel) {
        emit(Authsccsess());
      } else if (result is ErrorModel) {
        emit(AuthError("error Error alredy have"));
      } else if (result is ExceptionModel) {
        emit(Authfil("error Exception internet"));
      }
    });
  }
}
