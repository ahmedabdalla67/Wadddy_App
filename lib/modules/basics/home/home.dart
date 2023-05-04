// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:math';

import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget
{



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading:  Icon(
          Icons.menu,
        ),
        title:  Text(
          'First App',
        ),
        actions: [
          IconButton(onPressed: (){
            print("Hello");
          }, icon: Icon(Icons.notification_important,),),
          IconButton(onPressed: (){
            print("No Result");
          }, icon: Icon(Icons.search,),),

        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.5),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),

              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                    image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/10/09/00/55/lotus-978659_960_720.jpg'
                    ),
                    height: 300.0,
                    width: 300.0,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(.5),
                    width: 300.0,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Text(
                      'Hello',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}