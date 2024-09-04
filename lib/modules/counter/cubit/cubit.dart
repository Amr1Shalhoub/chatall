import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/modules/counter/cubit/states.dart';
class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit(): super(CounterInitialState());
  //var s=BlocProvider.of(context);
  static CounterCubit get(context)=>BlocProvider.of(context);
  int Counter=1;
  void Minus(){
    Counter--;
    emit(CounterMinusState(Counter));

  }
  void Plus(){
    Counter++;
    emit(CounterPlusState(Counter));

  }
}