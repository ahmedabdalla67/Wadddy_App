
import 'package:bloc/bloc.dart';

import 'package:first_app/modules/to_do_app/archived_new_tasks/archived_tasks_screen.dart';
import 'package:first_app/modules/to_do_app/done_new_tasks/done_tasks_screen.dart';
import 'package:first_app/modules/to_do_app/new_tasks/New_tasks_screen.dart';
import 'package:first_app/shared/cubit/app_states.dart';
import 'package:first_app/shared/network/local/cache_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bodyScreen = [
    const NewTasksScreen(),
    const DoneTasksScreen(),
    const ArchivedTasksScreen(),
  ];
  List<String> title = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks'
  ];

  void changeNav(int index)
  {
    currentIndex= index;
    emit(AppChangeNavBottom());
  }

  bool isBottomSheetShown = false;
  IconData fbIcon = Icons.edit;
  void changeIconBottomSheet({
    required bool isShown,
    required IconData icon,
  })
  {
    isBottomSheetShown = isShown;
    fbIcon = icon;
    emit(AppChangeIconBottomSheetState());
  }

  Database? db;
  List<Map> tasksNew = [];
  List<Map> tasksDone = [];
  List<Map> tasksArchived = [];

  // Create Database
  void createDatabase(){
    openDatabase(
      'tasks.db',
      version: 1,
      onCreate: (db, version) {
        if (kDebugMode) {
          print('Database Created');
          db.execute(
              'CREATE TABLE newTasks (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, date TEXT, time TEXT, status TEXT)'
          ).then((value) {
            if (kDebugMode) {
              print('Table Created');
            }
          }).catchError((error){
            if (kDebugMode) {
              print('Error Caught');
            }
          });
        }
      },
      onOpen: (db) {
        if (kDebugMode) {
          print('Database Opened');
        }
          getDataFromDatabase(db);
      },
    ).then((value) {
      db = value;
      emit(AppCreateDatabaseState());
    });
  }
  // Insert Into Database
  insertDatabase({
    required title,
    required time,
    required date,
  }) async{
    await db?.transaction((txn) {
      txn.rawInsert(
          'INSERT INTO newTasks (title, time, date, status) VALUES("$title", "$time", "$date", "new")'
      ).then((value) {
        emit(AppInsertDatabaseState());
        getDataFromDatabase(db);
        print('$value Inserted Successfully');
      }).catchError((error) {
        print('Error in inserting to table${error.toString()}');
      });
      return null!;
    });
  }
  // Get Data From Database
  void getDataFromDatabase(db){
    tasksArchived=[];
    tasksDone=[];
    tasksNew=[];
    emit(AppGetDatabaseLoadingState());
    db!.rawQuery('SELECT * FROM newTasks').then((value) {
      value.forEach((element) {
        if(element['status'] == 'new')
          tasksNew.add(element);
        else if(element['status'] == 'done')
          tasksDone.add(element);
        else tasksArchived.add(element);
      });
      emit(AppGetDatabaseState());
    });
  }
  // Update Data
  void updateData({
    required String status,
    required int id,
})
  {
    db!.rawUpdate(
      'UPDATE newTasks SET status= ? WHERE id= ?',
      ['$status', id],
    ).then((value) {
      getDataFromDatabase(db);
      emit(AppUpdateDatabaseState());
    });
  }

  bool isDark = false;
  void changeAppMode({bool? fromShared})
  {
    if(fromShared != null)
      {
        isDark = fromShared;
        emit(AppChangeModeState());
      }
    else
      {
        isDark = !isDark;
        CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
          emit(AppChangeModeState());
        });
      }
  }
}