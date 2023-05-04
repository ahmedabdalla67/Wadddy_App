

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:first_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
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
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
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
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultTextForm(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      text: 'Password',
                      prefix: Icons.lock,
                      valid: (String? value){
                        if(value!.isEmpty)
                          {
                            return 'Password is too short';
                          }
                        return null;
                      },
                      isSecure: isPassword,
                    suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                    suffixAction: (){
                        setState(() {
                          isPassword = !isPassword;
                        });
                    },
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultButton(
                    background: Colors.red,
                    width: 200.0,
                    text: 'login',
                    radius: BorderRadius.circular(20.0),
                    function: (){
                      if(formKey.currentState!.validate())
                        {
                          print(emailController.text);
                          print(passwordController.text);
                        }
                    }
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(

                      text: 'login',
                    radius: BorderRadius.circular(20.0),
                      function: ()
                      {

                        print(emailController.text);
                        print(passwordController.text);

                      },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: MaterialButton(
                      color: Colors.grey,
                      height: 40.0,
                      onPressed: () {
                        print(emailController.text);
                        print(passwordController.text);
                      },
                      child: Text(
                        'LOGOUT',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have account ?'),
                      TextButton(
                        onPressed: (){},
                        child: Text(
                            'Register'
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
  }
}
