import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/layout/cubit/cubit.dart';
import 'package:messenger_design2/layout/cubit/states.dart';
import 'package:messenger_design2/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Text(
    //     'Business Screen',
    //     style: TextStyle(
    //       fontSize: 20.0,
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    // );
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder: (context,state)
      {
        var list =NewsCubit.get(context).business;
        return articalBuilder(list,context);
      },
    );
  }
}
