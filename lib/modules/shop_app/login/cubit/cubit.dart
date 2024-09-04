

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/layout/shop_app/shop_app_cubit/states.dart';
import 'package:messenger_design2/models/shop_app/login_model.dart';
import 'package:messenger_design2/modules/shop_app/login/cubit/states.dart';
import 'package:messenger_design2/shared/network/end_points.dart';
import 'package:messenger_design2/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ShopLoginCubit():super(ShopLoginInitialState());
  static ShopLoginCubit get(context)=>BlocProvider.of(context);
  late ShopLoginModel loginModel;
  void UserLogin({
  required String email,
    required String password,


})
  {
    emit(ShopLoginLoadingState());


    DioHelper.postData(url: ShopLogin, data:
    {
      'email':email,
      'password':password,
    }
    ).then((value)
    {


        print(value.data);
        loginModel= ShopLoginModel.fromJson(value.data);
       // if(loginModel==null){ emit(ShopLoginDatanullErrorState(loginModel));}
        //else {emit(ShopLoginSuccessState(loginModel));}


        emit(ShopLoginSuccessState(loginModel));



      //  emit(ShopLoginLoadingState());


     // print(loginModel.status);

     // print(loginModel.data.name);


    }).catchError((error){
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }
  IconData suffix=Icons.visibility_outlined;
  bool isPasswordShown=true;
void ChangePasswordVisibility()
{
  isPasswordShown=!isPasswordShown;
  suffix=isPasswordShown ?Icons.visibility_outlined : Icons.visibility_off_outlined;
  emit(ShopChangePasswordVisibilityState());

}
}