import 'package:bloc/bloc.dart';
import 'package:first_app/layout/news_app/cubit/news_states.dart';
import 'package:first_app/modules/news_app/business/business_screen.dart';
import 'package:first_app/modules/news_app/science/science_screen.dart';
import 'package:first_app/modules/news_app/sports/sports_screen.dart';
import 'package:first_app/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit(): super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems =
  [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
      label: 'Business'
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'Sports'
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'Science'
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: 'Settings'
    ),
  ];

  void changeBottomNav (int index)
  {
    currentIndex = index;
    if(index == 1) {
      getSports();
    }
    if(index == 2) {
      getScience();
    }
    emit(NewsBottomNavState());
  }

  List<Widget> screens =
  [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  List <dynamic> business = [];

  void getBusiness()
  {
    emit(NewsBusinessLoadingState());
    if(business.isEmpty)
      {
        DioHelper.getData(
            url: 'v2/top-headlines',
            query: {
              'country':'eg',
              'category':'business',
              'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
            }
        ).then((value){
          //print(value.data.toString());
          business = value.data['articles'];
          print(business[0]['title']);
          emit(NewsBusinessSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(NewsBusinessErrorState(error.toString()));
        });
      }else{
      emit(NewsBusinessSuccessState());
    }
  }

  List <dynamic> sports = [];

  void getSports()
  {
    emit(NewsSportsLoadingState());
    if(sports.isEmpty)
      {
        DioHelper.getData(
            url: 'v2/top-headlines',
            query: {
              'country':'eg',
              'category':'sports',
              'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
            }
        ).then((value){
          //print(value.data.toString());
          sports = value.data['articles'];
          print(business[0]['title']);
          emit(NewsSportsSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(NewsSportsErrorState(error.toString()));
        });
      }else{
      emit(NewsSportsSuccessState());
    }
  }

  List<dynamic> science = [];
  void getScience()
  {
    emit(NewsScienceLoadingState());
    if(science.isEmpty)
      {
        DioHelper.getData(
            url: 'v2/top-headlines',
            query: {
              'country':'eg',
              'category':'science',
              'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
            }
        ).then((value){
          science = value.data['articles'];
          print(science[0]['title']);
          emit(NewsScienceSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(NewsScienceErrorState(error.toString()));
        });
      }else{
      emit(NewsScienceSuccessState());
    }
  }

  List<dynamic> search = [];
  void getSearch(String value)
  {
    emit(NewsSearchLoadingState());
    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q':'$value',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        }
    ).then((value){
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsSearchErrorState(error.toString()));
    });

  }


}