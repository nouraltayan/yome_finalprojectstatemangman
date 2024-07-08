import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_management/model/project/modelgetproject.dart';
import 'package:project_management/model/token/tokenmodel.dart';
import 'package:project_management/providar/fieldprovidar.dart';
import 'package:provider/provider.dart';
import 'core/router/config_router.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(tokenmodelAdapter());
  Hive.registerAdapter(getProjcetmodelAdapter());

  await Hive.openBox('projectBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FieldProvider(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
