import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:project_management/core/heares_config.dart';
import 'package:project_management/model/handling.dart';
import 'package:project_management/model/regrst/login.dart';
import 'package:project_management/model/regrst/regi_model.dart';
import 'package:project_management/model/token/tokenmodel.dart';
import 'package:project_management/servivc/Projectservice.dart';

abstract class UserService extends Service {
  Future<ResultModel> singup(Usermodel user);
  Future<ResultModel> login(Userloginmodel user);
  Future<ResultModel> logout();
}

class UserServiceImp extends UserService {
  @override
  Future<ResultModel> login(Userloginmodel user) async {
    try {
      print(user.toMap());
      response = await dio.post(baseurl + "auth/login", data: user.toMap());
      if (response.statusCode == 200) {
        print("j");
        tokenmodel token = tokenmodel.fromMap(response.data);

        box = Hive.box('projectBox');

        box.put('token', token);
        print("object");
        return token;
      } else {
        return ErrorModel();
      }
    } on DioException catch (e) {
      print(e.message.toString());
      return ExceptionModel();
    }
  }

  @override
  Future<ResultModel> singup(Usermodel user) async {
    try {
      print(user.toMap());

      response = await dio.post(baseurl + "auth/register", data: user.toMap());
      if (response.statusCode == 200) {
        tokenmodel token = tokenmodel.fromMap(response.data);
        print(token.access_token);
        box = Hive.box('projectBox');

        box.put('token', token);

        return token;
      } else {
        return ErrorModel();
      }
    } on DioException catch (e) {
      print(e.message.toString());
      return ExceptionModel();
    }
  }

  @override
  Future<ResultModel> logout() async {
    try {
      response = await dio.put(baseurl + "auth/logout", options: getHeader());

      if (response.statusCode == 200) {
        print("ok delet");

        return SuccessModel();
      } else {
        return ErrorModel();
      }
    } on DioException catch (e) {
      print(e.message.toString());
      return ExceptionModel();
    }
  }
}
