// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:first_app/shared/components/components.dart';
import 'package:first_app/shared/components/constants.dart';
import 'package:first_app/shared/cubit/app_cubit.dart';
import 'package:first_app/shared/cubit/app_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget
{
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state){
          if(state is AppInsertDatabaseState)
            {
              Navigator.pop(context);
            }
        },
        builder: (BuildContext context, AppStates state)
        {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.title[cubit.currentIndex],
              ),
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDatabaseLoadingState,
              builder: (context) =>cubit.bodyScreen[cubit.currentIndex],
              fallback: (context) =>Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
                child: Icon(cubit.fbIcon),
                onPressed: () {
                  if(cubit.isBottomSheetShown) // لو true هيحصل pop وترجع false يعني لو مفتوحه هتتقفل
                      {
                    if(formKey.currentState!.validate()){
                      cubit.insertDatabase(
                          title: titleController.text,
                          time: timeController.text,
                          date: dateController.text
                      );
                      // insertDatabase(
                      //   title: titleController.text,
                      //   time: timeController.text,
                      //   date: dateController.text,
                      // ).then((value) {
                      //   Navigator.pop(context);
                      //   getDataFromDatabase(db).then((value) {
                      //
                      //   });
                      // });
                    }
                  }else // لو هي مقفوله يعني false هتتفتح لحد ما تبقي false
                      {
                    scaffoldKey.currentState?.showBottomSheet(
                        elevation: 25.0,
                            (context) => Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Title Text Form Field
                                  defaultTextForm(
                                      controller: titleController,
                                      type: TextInputType.text,
                                      text: 'Task Title',
                                      prefix: Icons.title,
                                      valid: (String? value){
                                        if(value!.isEmpty)
                                        {
                                          return 'Title must not be empty';
                                        }
                                        return null;
                                      }
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  // Time Text Form Field
                                  defaultTextForm(
                                      controller: timeController,
                                      type: TextInputType.datetime,
                                      text: 'Time',
                                      prefix: Icons.access_time,
                                      onTap: (){
                                        showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        ).then((value) {
                                          timeController.text = value!.format(context).toString();
                                          print(value.format(context));
                                        });
                                      },
                                      valid: (String? value){
                                        if(value!.isEmpty)
                                        {
                                          return 'Time must not be empty';
                                        }
                                        return null;
                                      }
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  // Date Text Form Field
                                  defaultTextForm(
                                      controller: dateController,
                                      type: TextInputType.datetime,
                                      text: 'Date',
                                      prefix: Icons.calendar_today,
                                      onTap: (){
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.parse("2023-03-01"),
                                        ).then((value) {
                                          print(DateFormat.yMMMd().format(value!));
                                          dateController.text = DateFormat.yMMMd().format(value);
                                        });
                                      },
                                      valid: (String? value){
                                        if(value!.isEmpty)
                                        {
                                          return'Date must not be empty';
                                        }
                                        return null;
                                      }
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                    ).closed.then((value) {
                      cubit.changeIconBottomSheet(isShown: false, icon: Icons.edit);
                    });
                    cubit.changeIconBottomSheet(isShown: true, icon: Icons.add);
                  }
                }),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeNav(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: 'Archived',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

