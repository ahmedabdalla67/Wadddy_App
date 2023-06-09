import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:first_app/layout/waddy_app/cubit/ststes.dart';
import 'package:first_app/models/Waddy_app/track_id_model.dart';
import 'package:first_app/modules/waddy_app/chat/caht_screen.dart';
import 'package:first_app/modules/waddy_app/home/home_screen.dart';
import 'package:first_app/modules/waddy_app/my_order/my_order_screen.dart';
import 'package:first_app/modules/waddy_app/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ShippingCubit extends Cubit<ShippingStates>
{
  ShippingCubit() : super(ShippingInitialState());
  static ShippingCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    ShippingHomeScreen(),
    const ShippingMyOrderScreen(),
    const ShippingChatScreen(),
    const ShippingProfileScreen(),
  ];
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'home'
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.my_library_books_outlined),
        label: 'my Order'
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.chat),
        label: 'inBox'
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'profile'
    ),
  ];

  void changeBottom(int index)
  {
    currentIndex = index;
    emit(ChangeBottomNavBar());
  }

  List<TrackIdModel> trackId = [];
  getTackId()async
  {
    Response response = await http.get(
      Uri.parse('http://localhost:8080/client/order/track/:trackId')
    );
    var responseBody = jsonDecode(response.body);
    debugPrint('Track id is : $responseBody');
    if(responseBody['status'] == 200)
      {
        
      }
  }
}