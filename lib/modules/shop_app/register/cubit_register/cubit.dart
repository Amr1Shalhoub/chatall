

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/models/shop_app/login_model.dart';
import 'package:messenger_design2/modules/shop_app/login/cubit/states.dart';
import 'package:messenger_design2/modules/shop_app/register/cubit_register/states.dart';
import 'package:messenger_design2/shared/network/end_points.dart';
import 'package:messenger_design2/shared/network/remote/dio_helper.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates>
{
  ShopRegisterCubit():super(ShopRegisterInitialState());
  static ShopRegisterCubit get(context)=>BlocProvider.of(context);
  late ShopLoginModel loginModel;
  void UserRegister({
    required String name,
  required String email,
    required String password,
    required String phone,


})
  {
    emit(ShopRegisterLoadingState());


    DioHelper.postData(url: Register, data:
    {
      'name':name,
      'email':email,
      'password':password,
      'phone':phone,
    }
    ).then((value)
    {


        print(value.data);
        loginModel= ShopLoginModel.fromJson(value.data);
       // if(loginModel==null){ emit(ShopRegisterDatanullErrorState(loginModel));}
        //else {emit(ShopRegisterSuccessState(loginModel));}
        emit(ShopRegisterSuccessState(loginModel));


     // print(loginModel.status);

     // print(loginModel.data.name);


    }).catchError((error){
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
    });
  }
  IconData suffix=Icons.visibility_outlined;
  bool isPasswordShown=true;
void ChangePasswordVisibility()
{
  isPasswordShown=!isPasswordShown;
  suffix=isPasswordShown ?Icons.visibility_outlined : Icons.visibility_off_outlined;
  emit(ShopRegisterChangePasswordVisibilityState());

}
}