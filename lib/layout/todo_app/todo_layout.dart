
//import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
//import 'package:messenger_design2/modules/archived_tasks/archived_tasks_screen.dart';
//import 'package:messenger_design2/modules/done_tasks/done_tasks_screen.dart';
//import 'package:messenger_design2/modules/new_tasks/new_tasks_screen.dart';
import 'package:messenger_design2/shared/components/components.dart';
import 'package:messenger_design2/shared/components/constants.dart';
import 'package:messenger_design2/shared/cubit/cubit.dart';
import 'package:messenger_design2/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';


class HomeLayout  extends StatelessWidget
{

  // int bottombarindex=0;
  // List<Widget>screens =[
  //   NewTasksScreen(),
  //   DoneTasksScreen(),
  //   ArchivedTasksScreen(),
  //
  //
  //
  // ];
  // List<String>appbartitle=[
  //   'New Tasks',
  //   'Done Tasks',
  //   'Archived Tasks',
  //
  // ];
 // Database? database;
  var Scaffoldkey=GlobalKey<ScaffoldState>();
  var formkey=GlobalKey<FormState>();
  // bool isBottomSheetShown=false;
  // IconData fabIcon=Icons.edit;
  var titleController =TextEditingController();
  var timeController =TextEditingController();
  var dateController =TextEditingController();


  @override
  // void initState(){
  //   super.initState();
  //   CreatDatabase();
  // }
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..CreatDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context, AppStates state) {
          if(state is AppInsertDatabaseState){
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state)
        {
          return Scaffold(
            key: Scaffoldkey,
            appBar: AppBar(
              title: Text(
                  AppCubit.get(context). appbartitle[AppCubit.get(context). bottombarindex]
              ),
            ),
            // an example of future function handling and error catching
            floatingActionButton: FloatingActionButton(
              onPressed: (){

                // try{
                //   String name= await getname();
                //   print(name);
                //
                //
                // }
                // catch(error){
                //   print('error : ${error.toString()}');
                //
                // }
                // getname().then((value){
                //   print(value);
                //   print('Osama');
                //   throw('أنا عملت ايرور!!!!');
                //
                //
                // }).catchError((error){
                //   print('error is ${error.toString()}');
                // });




                // insertToDatabase();
                if(AppCubit.get(context).isBottomSheetShown){

                  if(formkey.currentState!.validate()){
                    AppCubit.get(context).insertToDatabase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text,
                    );


                    // ).then((value)
                    // {
                    //   //AppCubit.get(context).getDataFromDatabese(database);
                    //   // AppCubit.get(context).getDataFromDatabese(database).then((value){
                    //   //  // Navigator.pop(context);
                    //   //   // setState(() {
                    //   //   //
                    //   //   //   isBottomSheetShown=false;
                    //   //   //
                    //   //   //   fabIcon=Icons.edit;
                    //   //   //   tasks = value;
                    //   //   //   print(tasks);
                    //   //   //
                    //   //   // });
                    //   //
                    //   //
                    //   // });
                    //
                    //
                    //
                    // }



                  }


                }
                else{
                  Scaffoldkey.currentState!.showBottomSheet((context) =>Container(
                    color: Colors.grey[100],
                    padding: EdgeInsets.all(20.0,),
                    child: Form(
                      key: formkey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          defaultFormField(
                            prefix: Icons.title,
                            type: TextInputType.text,
                            controller: titleController,
                            validate: ( value){
                              if(value!.isEmpty){
                                return 'Title must not be empty';
                              }
                              return null;

                            },
                            label: 'Task Title',
                          ),
                          SizedBox(height: 15.0,),
                          defaultFormField(
                            //  isClickable: false,
                            prefix: Icons.watch_later_outlined,
                            type: TextInputType.datetime,
                            controller: timeController,
                            validate: ( value){
                              if(value!.isEmpty){
                                return 'Time must not be empty';
                              }
                              return null;

                            },
                            ontap: (){
                              print('tapped');
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                timeController.text=value!.format(context).toString();

                              } );
                            },
                            label: 'Task Time',
                          ),
                          SizedBox(height: 15.0,),
                          defaultFormField(

                            prefix: Icons.calendar_today,
                            type: TextInputType.datetime,
                            controller: dateController,
                            // isClickable: false,
                            validate: ( value){
                              if(value!.isEmpty){
                                return 'Date must not be empty';
                              }
                              return null;

                            },
                            ontap: (){
                              print('tapped');
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2022-11-05'),
                              ).then((value){
                                print(DateFormat.yMMMd().format(value!));
                                dateController.text=DateFormat.yMMMd().format(value);
                                //   dateController.text=value!.format(context).toString();
                              });

                            },
                            label: 'Task Date',
                          ),

                        ],
                      ),
                    ),
                  ),
                  ).closed.then((value) {
                    AppCubit.get(context).ChangeBottomSheetState(isShow: false, icon: Icons.edit);
                    // Navigator.pop(context);
                   // AppCubit.get(context).isBottomSheetShown=false;
                    // setState(() {
                    //   fabIcon=Icons.edit;
                    // });
                  } );
                  // AppCubit.get(context).isBottomSheetShown=true;
                  // // setState(() {
                  // //   fabIcon=Icons.add;
                  // // });
                  AppCubit.get(context).ChangeBottomSheetState(isShow: true, icon: Icons.add);

                }






              },
              child: Icon( AppCubit.get(context).fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: AppCubit.get(context). bottombarindex,
              showSelectedLabels: true,
              onTap: (index){
                AppCubit.get(context).ChangeIndex(index);
                // setState(() {
                //   bottombarindex=index;
                // });


                print(index);
              },

              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: 'Archived',
                ),
              ],
            ),
            body:state is AppGetDatabaseLoadingState? Center(child: CircularProgressIndicator()) : AppCubit.get(context). screens[AppCubit.get(context).bottombarindex],
            //tasks.length ==0 ? Center(child: CircularProgressIndicator()) : screens[bottombarindex],
          );
        },

      ),
    );
  }
  Future<String> getname()async
  {
    return 'Amr Shalhoub';
  }
  // void CreatDatabase()async{
  //   var database = openDatabase(
  //     'todo.db',
  //     version: 1,
  //     onCreate: (database,version)async{
  //       print('database created');
  //      await database.execute();
  //     },
  //     onOpen: (database){
  //       print('database opened');
  //     },
  //
  //
  //   );
  // }
  // void CreatDatabase()async{
  //   database = await openDatabase(
  //     'todo.db',
  //     version: 1,
  //     onCreate: (database,version){
  //       print('database created');
  //       database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)').then((value){
  //         print('table created');
  //       }).catchError((error){
  //         print('Error is ${error.toString()}');
  //       });
  //     },
  //     onOpen: (database){
  //       print('database opened');
  //       getDataFromDatabese(database).then((value){
  //         // setState(() {
  //         //   tasks = value;
  //         //   print(tasks);
  //         // });
  //
  //
  //       });
  //
  //     },
  //
  //
  //   );
  // }
  // Future insertToDatabase({
  //   required String title,
  //   required String time,
  //   required String date,
  //
  // })async
  // {
  //   return await database!.transaction((txn) async {
  //     txn.rawInsert('INSERT INTO tasks(title,date,time,status ) VALUES("$title","$date","$time","new")').then((value){
  //       print('$value inserted successfully');
  //     } ).catchError((error){
  //       print('Error is ${error.toString()}');
  //     });
  //
  //   });
  // }
  // Future<List<Map>> getDataFromDatabese(database)async
  // {
  //   return await database.rawQuery('SELECT * FROM tasks');
  //   // print(tasks);
  // }
}

