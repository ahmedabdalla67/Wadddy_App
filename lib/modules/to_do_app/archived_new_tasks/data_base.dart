// ignore_for_file: avoid_print

import 'package:first_app/shared/components/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseScreen extends StatefulWidget {
  const DataBaseScreen({Key? key}) : super(key: key);

  @override
  State<DataBaseScreen> createState() => _DataBaseScreenState();
}

class _DataBaseScreenState extends State<DataBaseScreen> {
  Database? db;
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var phoneController = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isBottomShown = false;
  IconData fbIcon = Icons.edit;
  @override
  void initState() {
    super.initState();
    databaseCreated();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(isBottomShown)
            {
              if(formKey.currentState!.validate())
                {
                  insertToDatabase(
                      name: nameController.text,
                      age: ageController.text,
                      phone: phoneController.text,
                  ).then((value) {
                    Navigator.pop(context);
                    isBottomShown = false;
                    setState(() {
                      fbIcon = Icons.edit;
                    });
                  });
                }
            }else
            {
            scaffoldKey.currentState?.showBottomSheet(
                    (context) => Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defaultTextForm(
                                  controller: nameController,
                                  type: TextInputType.text,
                                  text: 'Your Name',
                                  prefix: Icons.person,
                                  valid: (String? value){
                                    if(value!.isEmpty){
                                        return 'Name must not be empty';
                                    }
                                    return null;
                                  }
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              defaultTextForm(
                                  controller: ageController,
                                  type: TextInputType.number,
                                  text: 'Your Age',
                                  prefix: Icons.person,
                                  valid: (String? value){
                                    if(value!.isEmpty){
                                        return 'Age must not be empty';
                                    }
                                    return null;
                                  }
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              defaultTextForm(
                                  controller: phoneController,
                                  type: TextInputType.phone,
                                  text: 'Your Phone',
                                  prefix: Icons.phone,
                                  valid: (String? value){
                                    if(value!.isEmpty){
                                        return 'Phone must not be empty';
                                    }
                                    return null;
                                  }
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
            );
            isBottomShown= true;
            setState((){
              fbIcon = Icons.add;
            });
          }

        },
        child: Icon(fbIcon),
      ),
    );
  }
  // Create Database
  void databaseCreated()async{
    db = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (db, version) {
        if (kDebugMode) {
          print('Database Created');
          db.execute(
              'CREATE TABLE INFO (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age NUMBER, phone TEXT)'
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
      },
    );
  }
  // Insert Into Database
  Future insertToDatabase ({
    required name,
    required age,
    required phone,
  })async{
    return await db?.transaction((txn) {
      txn.rawInsert(
          'INSERT INTO INFO (name, age, phone) VALUES ("$name", "$age", "$phone")'
      ).then((value) {
        if (kDebugMode) {
          print('Data Inserted');
        }
      }).catchError((error){
        if (kDebugMode) {
          print('Error In Inserting ${error.toString()}');
        }
      });
      return null!;
    });
  }
}
