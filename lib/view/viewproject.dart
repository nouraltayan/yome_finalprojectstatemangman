import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_management/bloc/Auther/atherbloc.dart';
import 'package:project_management/bloc/blocproject/projectbloc.dart';
import 'package:project_management/core/heares_config.dart';
import 'package:project_management/core/res/app_string.dart';
import 'package:project_management/core/res/app_text_style.dart';
import 'package:project_management/core/res/color_palete.dart';
import 'package:project_management/model/project/modelgetproject.dart';

class viweproject extends StatelessWidget {
  late var task;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primar,
        width: double.infinity,
        child: BlocProvider(
          create: (context) => AuthBloc(),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is Authsccsess) {
                context.go('/signup');
              }
              if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(AppString().textError)),
                );
              }
              if (state is Authfil) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(AppString().textfild)),
                );
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return Center(child: CircularProgressIndicator());
              } else {
                getProjcetmodel getProjc = box.get('getProjce');
                var task = box.get('task');
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 70.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: 400,
                        height: 55,
                        decoration: BoxDecoration(
                          color: third,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.menu),
                              onPressed: () {},
                            ),
                            Text(
                              "Project name",
                              style: text12,
                            ),
                            BlocProvider(
                              create: (context) => ProjectBloc(),
                              child: BlocConsumer<ProjectBloc, ProjectState>(
                                listener: (context, state) {
                                  if (state is Projectsccsess) {
                                    context.go('/signup/home');
                                  }
                                },
                                builder: (context, state) {
                                  if (state is ProjectLoading) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                  return PopupMenuButton<String>(
                                    icon: const Icon(Icons.more_horiz),
                                    onSelected: (value) {
                                      if (value == "Delet") {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Center(
                                              child: Container(
                                                height: 200,
                                                width: 367,
                                                padding: const EdgeInsets.only(
                                                    top: 20.0),
                                                decoration: BoxDecoration(
                                                  color: reddelet,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  title: Text(
                                                    'Are you sure you want to delete this project?',
                                                    style: tex1,
                                                  ),
                                                  content: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              bootonyes,
                                                        ),
                                                        onPressed: () {
                                                          context
                                                              .read<
                                                                  ProjectBloc>()
                                                              .add(
                                                                  deletproject());
                                                        },
                                                        child: Text(
                                                          'Yes, I am sure',
                                                          style: tex,
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text('Cancel'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      } else if (value == "logout") {
                                        context
                                            .read<AuthBloc>()
                                            .add(Logoutbottom());
                                      }
                                    },
                                    itemBuilder: (BuildContext context) =>
                                        <PopupMenuEntry<String>>[
                                      const PopupMenuItem<String>(
                                        value: "Delet",
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 8.0),
                                              child: Icon(Icons.delete),
                                            ),
                                            Text(
                                              'Delete',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const PopupMenuItem<String>(
                                        value: "logout",
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 8.0),
                                              child: Icon(Icons.logout),
                                            ),
                                            Text(
                                              'Logout',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 10, left: 35, right: 35),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: botto,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            getProjc.description,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        itemCount: task.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, right: 250),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 4.0, right: 4.0, top: 10.0, bottom: 2),
                              decoration: BoxDecoration(
                                color: purbel,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Backing "),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            // image: DecorationImage(
                                            //   image: AssetImage(
                                            //       'asses/image/bug.png'),
                                            //   scale: 20,
                                            // ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 30,
                                    color: Colors.white,
                                    // decoration: BoxDecoration(
                                    //   border: Border.all(
                                    //     color: Colors.white,
                                    //     width: 6.0,
                                    //   ),
                                    //   borderRadius: BorderRadius.circular(10),
                                    // ),
                                    child: Text(task[index]['taskDescription']),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          onPressed: () {},
                          child: Icon(Icons.add),
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
