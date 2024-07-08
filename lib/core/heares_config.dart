import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:project_management/model/token/tokenmodel.dart';

late Box box;

Options getHeader({bool useToken = true}) {
  if (useToken) {
    box = Hive.box('projectBox');
    tokenmodel token = box.get('token');

    return Options(
      headers: {
        'Authorization': 'Bearer ${token.access_token}',
      },
    );
  } else {
    return Options();
  }
}
