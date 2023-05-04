import 'dart:async';

import 'package:first_app/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:first_app/modules/waddy_app/splash/waddy_on_boarding_screen.dart';
import 'package:first_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({Key? key}) : super(key: key);

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
        (){navigateToAndFinish(context, WaddyOnBoardingScreen());}
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash2-bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Welcome To',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'WADDI',
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'The Best App For Shipping & Delivery '
                    'In Egypt',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
