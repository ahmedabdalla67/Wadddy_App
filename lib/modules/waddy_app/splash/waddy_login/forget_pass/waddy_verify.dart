import 'package:first_app/modules/waddy_app/splash/waddy_login/cubit/cubit.dart';
import 'package:first_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class WaddyVerifyScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forget Password',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Image(
                  image: AssetImage(
                      'assets/images/forget-pass.png'
                  ),
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                  'We will send a code in message to reset your password',
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                //Text Form Field Component For Email Address
                defaultTextForm(
                  controller: otpController,
                  type: TextInputType.phone,
                  text: 'Verify Code',
                  prefix: Icons.verified,
                  valid: (String? value){
                    if(value!.isEmpty) {
                      return 'email must not be empty';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                // Button Component ---------------------
                defaultButton(
                  function: (){
                    if(formKey.currentState!.validate())
                    {
                      // WaddyLoginCubit.get(context).userLogin(otp: otpController.text);
                    }
                  },
                  radius: BorderRadius.circular(20.0),
                  text: 'Send Code',

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
