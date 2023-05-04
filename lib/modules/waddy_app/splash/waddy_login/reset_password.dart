import 'package:first_app/layout/waddy_app/waddy_layout_screen.dart';
import 'package:first_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isPassword = true;

  TextEditingController passController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create new password',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage(
                        'assets/images/reset-pass.png'
                    ),
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    'Create your new password',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  defaultTextForm(
                      controller: passController,
                      type: TextInputType.visiblePassword,
                      text: 'new password',
                      prefix: Icons.lock,
                      isSecure: isPassword,
                      suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                      suffixAction: (){
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      valid: (String? value){
                        if(value!.isEmpty)
                          {
                            return 'must not be empty';
                          }else {
                          return null;
                        }
                      }
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  defaultTextForm(
                      controller: passController,
                      type: TextInputType.visiblePassword,
                      text: 'confirm password',
                      prefix: Icons.lock,
                      isSecure: isPassword,
                      suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                      suffixAction: (){
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      valid: (String? value){
                        if(value!.isEmpty)
                        {
                          return 'must not be empty';
                        }else {
                          return null;
                        }
                      }
                  ),

                  const SizedBox(
                    height: 30.0,
                  ),
                  defaultButton(
                      function: (){
                        navigateToAndFinish(context, Waddylayout());
                      },
                      radius: BorderRadius.circular(20.0),
                      text: 'Reset Password'
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
