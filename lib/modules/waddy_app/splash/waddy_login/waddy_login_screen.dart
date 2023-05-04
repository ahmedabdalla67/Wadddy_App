import 'dart:convert';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/layout/waddy_app/waddy_layout_screen.dart';
import 'package:first_app/models/Waddy_app/Waddy_app_model.dart';
import 'package:first_app/models/user/user_model.dart';
import 'package:first_app/modules/basics/home/home.dart';
import 'package:first_app/modules/to_do_app/todo_app/todo_layout.dart';
import 'package:first_app/modules/waddy_app/home/home_screen.dart';
import 'package:first_app/modules/waddy_app/splash/waddy_login/cubit/cubit.dart';
import 'package:first_app/modules/waddy_app/splash/waddy_login/cubit/states.dart';
import 'package:first_app/modules/waddy_app/splash/waddy_login/forget_pass/waddy_forget_pass_screen.dart';
import 'package:first_app/shared/components/components.dart';
import 'package:first_app/shared/network/end_point.dart';
import 'package:first_app/shared/network/local/cache_helper.dart';
import 'package:first_app/shared/network/remote/dio_helper.dart';
import 'package:first_app/shared/network/remote/services.dart';
import 'package:first_app/shared/styles/colors.dart';
import 'package:first_app/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WaddyLoginScreen extends StatelessWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WaddyLoginCubit(),
      child: BlocConsumer<WaddyLoginCubit, WaddyLoginStates>
        (
        listener: (context, state){
          if(state is LoginLoadingState)
            {
              showDialog(context: context, builder: (context){
                return AlertDialog(
                   backgroundColor: Colors.white,
                  content: AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeIn,
                    child: Row(
                      children: const [
                        CupertinoActivityIndicator(color: Colors.redAccent,),
                        SizedBox(width: 15.0,),
                        Text('wait',style: TextStyle(fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                );
              });
            }
          else if(state is LoginSuccessState)
            {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: const Text('Valid email'),
                  )
              ),
              );
              Navigator.pop(context);
              navigateToAndFinish(context, ShippingHomeScreen());
            }
          else if(state is FailedToLoginState)
            {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.red,
                  content: Text(state.message),
                );
              });
            }
        },
        builder: (context, state)
        {
          return Scaffold(
            appBar: AppBar(
              title: Image.asset('assets/images/splash-1.png',width: 300.0, height: 50.0,)
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultTextForm(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          text: 'Email',
                          prefix: Icons.email,
                          valid: (String? value){
                            if(value!.isEmpty)
                            {
                              return 'email must not be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultTextForm(
                          controller: passwordController,
                          type: TextInputType.number,
                          text: 'Password',
                          prefix: Icons.lock,
                          valid: (String? value){
                            if(value!.isEmpty)
                            {
                              return 'Password is too short';
                            }
                            return null;
                          },
                            suffix: WaddyLoginCubit.get(context).suffix,
                          isSecure: WaddyLoginCubit.get(context).isPassword,
                          suffixAction: ()
                          {
                            WaddyLoginCubit.get(context).changePasswordVisibility();
                          }

                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! WaddyLoadingState,
                          builder: (context) =>defaultButton(
                            background: defaultColor,
                            width: double.infinity,
                            text: 'login',
                            radius: BorderRadius.circular(20.0),
                            function: (){
                              if(formKey.currentState!.validate())
                              {
                                WaddyLoginCubit.get(context).login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                );
                              }
                            },

                          ),
                          fallback: (context) => const Center(child: CircularProgressIndicator()),
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: (){
                              navigateTo(context, Test());
                            },
                            child: const Text(
                              'Forgot Password ?',
                              style: TextStyle(
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have account ?'),
                            TextButton(
                              onPressed: (){},
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      )
    );
  }

}
