import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_management/bloc/blocproject/projectbloc.dart';
import 'package:project_management/core/res/app_string.dart';
import 'package:project_management/core/res/app_text_style.dart';
import 'package:project_management/core/res/color_palete.dart';
import 'package:project_management/model/project/projectmodel.dart';

class creatPage extends StatelessWidget {
  final TextEditingController nameprojectController = TextEditingController();
  final TextEditingController projectscriptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            const Padding(
              padding: EdgeInsets.only(
                left: 30.0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "project name",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            BlocProvider(
              create: (context) => ProjectBloc(),
              child: BlocConsumer<ProjectBloc, ProjectState>(
                listener: (context, state) {
                  if (state is Projectsccsess) {
                    context.go('/signup/home/newproject/newtask');
                  } else if (state is ProjectError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(AppString().textError)),
                    );
                  } else if (state is Projectfil) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(AppString().textfild)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ProjectLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ProjectError || state is Projectfil) {
                    return Container(
                      height: 400,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 30.0, right: 30, top: 20),
                            child: TextField(
                              controller: nameprojectController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 30.0,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.0, top: 60),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "project script",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 30.0, right: 30, top: 20),
                              child: TextField(
                                controller: projectscriptController,
                                maxLines: null,
                                expands: true,
                                decoration: InputDecoration(
                                  hintText: '',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            height: 90,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Projcetmodel pro = Projcetmodel(
                                    projectName: nameprojectController.text,
                                    projectDescription:
                                        projectscriptController.text,
                                    projectStatus: " ",
                                  );
                                  context
                                      .read<ProjectBloc>()
                                      .add(NewprojectButtonPressed(pro));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: botto,
                                  minimumSize: Size(380, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text('Create Agen', style: text1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Container(
                    height: 400,
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 30.0, right: 30, top: 20),
                          child: TextField(
                            controller: nameprojectController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 30.0,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 5.0, top: 60),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "project script",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: 30.0, right: 30, top: 20),
                            child: TextField(
                              controller: projectscriptController,
                              maxLines: null,
                              expands: true,
                              decoration: InputDecoration(
                                hintText: '',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          height: 90,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Projcetmodel pro = Projcetmodel(
                                  projectName: nameprojectController.text,
                                  projectDescription:
                                      projectscriptController.text,
                                  projectStatus: " ",
                                );
                                context
                                    .read<ProjectBloc>()
                                    .add(NewprojectButtonPressed(pro));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: botto,
                                minimumSize: Size(380, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text('Create', style: text1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
