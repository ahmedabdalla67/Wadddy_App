// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, must_be_immutable

import 'package:first_app/models/user/user_model.dart';
import 'package:flutter/material.dart';



class User_Screen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(id: 1, name: 'Ahmed Abdalla', phone: '01032154747'),
    UserModel(id: 2, name: 'Mohamed Abdalla', phone: '01032568974'),
    UserModel(id: 3, name: 'Adel Ragab', phone: '0103654789'),
    UserModel(id: 1, name: 'Ahmed Abdalla', phone: '01032154747'),
    UserModel(id: 2, name: 'Mohamed Abdalla', phone: '01032568974'),
    UserModel(id: 3, name: 'Adel Ragab', phone: '0103654789'),
    UserModel(id: 1, name: 'Ahmed Abdalla', phone: '01032154747'),
    UserModel(id: 2, name: 'Mohamed Abdalla', phone: '01032568974'),
    UserModel(id: 3, name: 'Adel Ragab', phone: '0103654789'),
    UserModel(id: 3, name: 'Adel Ragab', phone: '0103654789'),
    UserModel(id: 1, name: 'Ahmed Abdalla', phone: '01032154747'),
    UserModel(id: 2, name: 'Mohamed Abdalla', phone: '01032568974'),
    UserModel(id: 3, name: 'Adel Ragab', phone: '0103654789'),
  ];

  User_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(users[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20.0,
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey,
          ),
        ),
        itemCount: users.length,
      ),
    );
  }
  Widget buildUserItem(UserModel user){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.0,
            child: Text(
              '${user.id}',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${user.name}',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                '${user.phone}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
