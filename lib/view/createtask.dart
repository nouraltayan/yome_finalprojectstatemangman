import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_management/bloc/bloctask/taskbloc.dart';
import 'package:project_management/core/heares_config.dart';
import 'package:project_management/core/res/app_string.dart';
import 'package:project_management/core/res/app_text_style.dart';
import 'package:project_management/core/res/color_palete.dart';
import 'package:project_management/model/project/modelgetproject.dart';
import 'package:project_management/providar/fieldprovidar.dart';
import 'package:provider/provider.dart';

class DynamicTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getProjcetmodel getProjc = box.get('getProjce');

    return Scaffold(
      body: Container(
        color: primar,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('asses/image/image.png'),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Task",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<FieldProvider>(context, listen: false)
                        .addTextField();
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
            Consumer<FieldProvider>(
              builder: (context, fieldProvider, child) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: fieldProvider.controllers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 4.0, right: 4.0, top: 10.0),
                                decoration: BoxDecoration(
                                  color: purbel,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: purbel,
                                      width: 6.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
                                    controller:
                                        fieldProvider.controllers[index],
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                fieldProvider.removeTextField(index);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            BlocProvider(
              create: (context) => taskBloc(),
              child: BlocConsumer<taskBloc, taskState>(
                listener: (context, state) {
                  if (state is tasksccsess) {
                    context.go('/signup/home/newproject/newtask/viweproject');
                  } else if (state is taskError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(AppString().textError)),
                    );
                  } else if (state is taskfil) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(AppString().textfild)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is taskLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is taskError || state is taskfil) {
                    return Container(
                      height: 90,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: ElevatedButton(
                          onPressed: () {
                            List<String> contents = Provider.of<FieldProvider>(
                                    context,
                                    listen: false)
                                .getTextFieldsContent();
                            print(contents);

                            List<Map<String, dynamic>> tasks = [];

                            for (int i = 0; i < contents.length; i++) {
                              Map<String, dynamic> task = {
                                'taskDescription': contents[i],
                                'taskStatus': "new",
                                'project_id': getProjc.id,
                              };
                              tasks.add(task);
                            }
                            print(tasks);

                            context
                                .read<taskBloc>()
                                .add(taskButtonPressed(tasks));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: botto,
                            minimumSize: Size(300, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text('CreateAgen', style: text1),
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      height: 90,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: ElevatedButton(
                          onPressed: () {
                            List<String> contents = Provider.of<FieldProvider>(
                                    context,
                                    listen: false)
                                .getTextFieldsContent();
                            print(contents);

                            List<Map<String, dynamic>> tasks = [];

                            for (int i = 0; i < contents.length; i++) {
                              Map<String, dynamic> task = {
                                'taskDescription': contents[i],
                                'taskStatus': "new",
                                'project_id': getProjc.id,
                              };
                              tasks.add(task);
                            }
                            print(tasks);

                            context
                                .read<taskBloc>()
                                .add(taskButtonPressed(tasks));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: botto,
                            minimumSize: Size(300, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text('Create', style: text1),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
