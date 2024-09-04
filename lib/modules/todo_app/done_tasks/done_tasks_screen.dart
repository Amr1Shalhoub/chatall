
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/shared/components/components.dart';
import 'package:messenger_design2/shared/cubit/cubit.dart';
import 'package:messenger_design2/shared/cubit/states.dart';

class DoneTasksScreen extends StatelessWidget {
  const DoneTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener:(context,state){} ,
      builder: (context,state){
        var tasks=AppCubit.get(context).donetasks;
        return   ConditionalBuilder(
          condition:tasks.length>0 ,
          builder: (context)=>ListView.separated(
            itemBuilder:(context,index)=> buildTasksItem(tasks[index],context),
            separatorBuilder:(context,index)=> Padding(
              padding: const EdgeInsetsDirectional.only(start: 20.0),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color:Colors.grey[300] ,

              ),
            ),
            itemCount: tasks.length,
          ),
          fallback: (context)=>Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.menu,
                  size: 100,
                  color: Colors.grey,

                ),
                Text('No Tasks yet , Please Add Some Tasks',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),


        );
      },

    );

  }
}
