import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_management/bloc/Auther/atherbloc.dart';
import 'package:project_management/core/res/app_string.dart';
import 'package:project_management/core/res/app_text_style.dart';
import 'package:project_management/core/res/color_palete.dart';
import 'package:project_management/model/regrst/login.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primar,
        child: Column(
          children: [
            Builder(builder: (context) {
              return Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 60.0, right: 60, top: 70),
                        child: Container(
                          height: 500,
                          decoration: BoxDecoration(
                            color: colorgray,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 25.0,
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      AppString().textemail,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, right: 18.0),
                                  child: Container(
                                    height: 60,
                                    child: TextFormField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                          hintText: "Email@gmail.com",
                                          hintStyle: TextStyle(color: primar),
                                          filled: true,
                                          fillColor: third,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                      style: const TextStyle(
                                        color: primar,
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your email';
                                        }
                                        // if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                        //     .hasMatch(value)) {
                                        //   return 'Please enter a valid email address';
                                        // }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 35.0, left: 25.0, bottom: 10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      AppString().textpassword,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, right: 18.0),
                                  child: SizedBox(
                                    height: 60,
                                    child: TextFormField(
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                        hintText: "*******",
                                        hintStyle: TextStyle(color: primar),
                                        suffixIcon: const Icon(
                                          Icons.visibility,
                                          color: primar,
                                        ),
                                        filled: true,
                                        fillColor: third,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                            color: primar,
                                            width: 6.0,
                                          ),
                                        ),
                                      ),
                                      style: const TextStyle(
                                        color: primar,
                                      ),
                                      obscureText: true,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your password';
                                        }
                                        if (value.length < 1) {
                                          return 'Password must be at least 4 characters long';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 1.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: false,
                                        onChanged: (value) {},
                                        activeColor: colorgray,
                                        fillColor: MaterialStateProperty.all(
                                            Colors.grey),
                                        side: const BorderSide(
                                          color: Colors.grey,
                                          width: 2.0,
                                        ),
                                      ),
                                      const Text(
                                        'Remember me',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),

                                // ElevatedButton(
                                //   onPressed: () {
                                //     context.go('/signup');
                                //   },
                                //   child: Text('Register'),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 175,
                        top: 2,
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(75.0),
                            child: Image.asset(
                              'asses/image/circel.png',
                              fit: BoxFit.cover,
                              height: 130,
                              width: 130,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
            BlocProvider(
              create: (context) => AuthBloc(),
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is Authsccsess) {
                    print("create ok");
                    context.go('/signup/home');
                  } else if (state is AuthError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(AppString().textError)),
                    );
                  } else if (state is Authfil) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(AppString().textfild)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is AuthError || state is Authfil) {
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Userloginmodel user = Userloginmodel(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            context.read<AuthBloc>().add(Loginbutton(user));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: botto,
                          minimumSize: Size(385, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('LoginAgen', style: text1),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Userloginmodel user = Userloginmodel(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            context.read<AuthBloc>().add(Loginbutton(user));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: botto,
                          minimumSize: Size(385, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('Login', style: text1),
                      ),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account ?",
                    style: text3,
                  ),
                  InkWell(
                    onTap: () {
                      context.go('/signup');
                    },
                    child: Text(
                      "Sign up",
                      style: text31,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
