// import 'package:first_app/shared/components/components.dart';
// import 'package:flutter/material.dart';
//
// class ForgetPasswordScreen extends StatefulWidget {
//   const ForgetPasswordScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
// }
//
// class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
//
//   var emailController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Forget Password',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 25.0,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Image(
//               image: AssetImage(
//                   'assets/images/forget-pass.png'
//               ),
//             fit: BoxFit.cover,
//           ),
//           //Text Form Field Component For Email Address
//           defaultTextForm(
//               controller: emailController,
//               type: TextInputType.emailAddress,
//               text: 'Email Address',
//               prefix: Icons.email,
//               valid: (String? value){
//                 if(value!.isEmpty) {
//                   return 'email must not be empty';
//                 } else {
//                   return null;
//                 }
//               },
//           ),
//           // Button Component ---------------------
//           defaultButton(
//               function: (){},
//               radius: BorderRadius.circular(20.0),
//               text: 'Send Code',
//           ),
//         ],
//       ),
//     );
//   }
// }
