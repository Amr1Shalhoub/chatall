import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/modules/counter/cubit/states.dart';

import 'cubit/cubit.dart';

class CounterScreeen extends StatelessWidget {

  //const CounterScreeen({Key? key}) : super(key: key);


  @override

  Widget build(BuildContext context) {
   // var C=CounterCubit.get(context);


    return BlocProvider(
      create: (BuildContext context)=>CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context,state){

          if(state is CounterMinusState){
            print('Minus state ${state.Counter}');
          }
          if(state is CounterPlusState){
            print('Plus state ${state.Counter}');
          }
        },
        builder: (context,state){
          return  Scaffold(
            appBar: AppBar(
                title:Text(
                  'Counter',
                )

            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed:(){

                      CounterCubit.get(context).Minus();
                    },
                    child: Text('MINUS',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Text(
                    '${CounterCubit.get(context).Counter}',style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  SizedBox(width: 10.0,),
                  TextButton(
                    onPressed:(){
                      CounterCubit.get(context).Plus();
                    },
                    child: Text('PLUS',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
