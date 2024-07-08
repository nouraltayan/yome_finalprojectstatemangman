// animal_servivc/animal_service.dart

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:project_management/core/heares_config.dart';
import 'package:project_management/model/handling.dart';
import 'package:project_management/model/project/modelgetproject.dart';
import 'package:project_management/model/project/projectmodel.dart';

abstract class Service {
  Dio dio = Dio();
  late Response response;
  late Box box1;
  String baseurl = "https://projects-management-system.onrender.com/api/v1/";
}

abstract class projectService extends Service {
  Future<ResultModel> newproject(Projcetmodel projct);
  Future<ResultModel> newtask(List<Map<String, dynamic>> task);
  Future<ResultModel> getProject();
  Future<ResultModel> deletproject();
}

class proServiceImp extends projectService {
  @override
  Future<ResultModel> newproject(Projcetmodel projct) async {
    try {
      // print("https://projects-management-system.onrender.com/api/v1/" +
      //     "projects");
      response = await dio.post(baseurl + "projects",
          data: projct.toMap(), options: getHeader());
      // getProjcetmodel
      print(response.data);
      if (response.statusCode == 200) {
        getProjcetmodel getProjce = getProjcetmodel.fromMap(response.data);
        box1 = Hive.box('projectBox');
        box1.put('getProjce', getProjce);
        return SuccessModel();
      } else {
        return ErrorModel();
      }
    } on DioException catch (e) {
      print(e);
      return ExceptionModel();
    }
  }

  @override
  Future<ResultModel> newtask(List<Map<String, dynamic>> task) async {
    try {
      response =
          await dio.post(baseurl + "tasks", data: task, options: getHeader());
      box1 = Hive.box('projectBox');
      box1.put('task', task);
      print(response.data);
      if (response.statusCode == 200) {
        return SuccessModel();
      } else {
        return ErrorModel();
      }
    } on DioException catch (e) {
      print(e.message.toString());
      return ExceptionModel();
    }
  }

  @override
  Future<ResultModel> getProject() async {
    try {
      var box1 = Hive.box('projectBox');
      getProjcetmodel getProjc = box1.get('getProjce');
      String apiUrl = baseurl + "projects/${getProjc.id}";
      print(apiUrl);
      response = await dio.get(
        apiUrl,
        options: getHeader(),
      );

      if (response.statusCode == 200) {
        getProjcetmodel getProjce = getProjcetmodel.fromMap(response.data);

        return getProjce;
      } else {
        return ErrorModel();
      }
    } on DioException catch (e) {
      print(e.message.toString());

      return ExceptionModel();
    }
  }

  Future<ResultModel> deletproject() async {
    try {
      var box1 = Hive.box('projectBox');
      getProjcetmodel getProjc = box1.get('getProjce');
      print(baseurl + "projects/${getProjc.id}");

      response = await dio.delete(
        baseurl + "projects/${getProjc.id}",
        options: getHeader(),
      );
      if (response.statusCode == 200) {
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
