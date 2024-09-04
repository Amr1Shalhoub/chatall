import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:messenger_design2/modules/archived_tasks/archived_tasks_screen.dart';
//import 'package:messenger_design2/modules/done_tasks/done_tasks_screen.dart';
//import 'package:messenger_design2/modules/new_tasks/new_tasks_screen.dart';
import 'package:messenger_design2/shared/cubit/states.dart';
import 'package:messenger_design2/shared/network/local/cache_helper.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/todo_app/archived_tasks/archived_tasks_screen.dart';
import '../../modules/todo_app/done_tasks/done_tasks_screen.dart';
import '../../modules/todo_app/new_tasks/new_tasks_screen.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  static AppCubit get(context)=>BlocProvider.of(context);
  int bottombarindex=0;
  Database ?database;
  List<Map> newtasks = [];
  List<Map> donetasks = [];
  List<Map> archivetasks = [];
  List<Widget>screens =[
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),



  ];
  List<String>appbartitle=[
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',

  ];
  void ChangeIndex(int index){
     bottombarindex=index;
     emit(AppChangeBottomNavAppBarState());

  }
  void CreatDatabase(){
   openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database,version){
        print('database created');
        database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)').then((value){
          print('table created');
        }).catchError((error){
          print('Error is ${error.toString()}');
        });
      },
      onOpen: (database){
        print('database opened');
        getDataFromDatabese(database);

      },


    ).then((value) {
      database=value;
      emit(AppCreateDatabaseState());
    });
  }
   insertToDatabase({
    required String title,
    required String time,
    required String date,

  })async
  {
    await database!.transaction((txn) async {
      txn.rawInsert('INSERT INTO tasks(title,date,time,status ) VALUES("$title","$date","$time","new")').then((value){
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());
        getDataFromDatabese(database);
        //getDataFromDatabese(database)
      } ).catchError((error){
        print('Error is ${error.toString()}');
      });

    });
  }
  void getDataFromDatabese(database)
  {
    newtasks=[];
    donetasks=[];
    archivetasks=[];
    emit(AppGetDatabaseLoadingState());
     database.rawQuery('SELECT * FROM tasks').then((value){
      // tasks = value;
      // print(tasks);

      value.forEach((element) {
        if(element['status']=='new')
          newtasks.add(element);
        else if(element['status']=='done')
          donetasks.add(element);
      //  print(element['status']);
        else { archivetasks.add(element);}
      });

      emit(AppGetDatabaseState());

    });;
    // print(tasks);
  }
  void updateData({
  required String status,
    required int id,

})async
  {
      database!.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', '$id']).then((value){

          emit(AppUpdateDatabaseState());
          getDataFromDatabese(database);


      });


  }
  void deleteData({
    required int id,

  })async
  {
    database!.rawDelete(
        'DELETE FROM tasks WHERE id = ?', [id]).then((value){

      emit(AppDeleteDatabaseState());
      getDataFromDatabese(database);


    });


  }
  bool isBottomSheetShown=false;
  IconData fabIcon=Icons.edit;
  void ChangeBottomSheetState({
  required bool isShow,
    required IconData icon,

})
  {
    isBottomSheetShown=isShow;
    fabIcon=icon;
    emit(AppChangeBottomSheetState());

  }
  bool isDark=false;
  ThemeMode appMode =ThemeMode.dark;
  void ChangeAppMode({bool? fromShared})
  {
    if(fromShared!=null)
    {
      isDark=fromShared;
      emit(AppChangeModeState());
    }
    else{ isDark=!isDark;
    CacheHelper.putData(key: 'isDark', value: isDark).then((value)  {
      emit(AppChangeModeState());
    });

    }




  }

}