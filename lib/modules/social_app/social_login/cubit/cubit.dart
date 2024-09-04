

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/layout/shop_app/shop_app_cubit/states.dart';
import 'package:messenger_design2/models/shop_app/login_model.dart';
import 'package:messenger_design2/modules/shop_app/login/cubit/states.dart';
import 'package:messenger_design2/modules/social_app/social_login/cubit/states.dart';
import 'package:messenger_design2/shared/network/end_points.dart';
import 'package:messenger_design2/shared/network/remote/dio_helper.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates>
{
  SocialLoginCubit():super(SocialLoginInitialState());
  static SocialLoginCubit get(context)=>BlocProvider.of(context);
 // late SocialLoginModel loginModel;
  void UserLogin({
  required String email,
    required String password,


})
  {
    emit(SocialLoginLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value){
      emit(SocialLoginSuccessState(value.user!.uid));
      print(value.user?.email);
      print(value.user?.uid);


    })
        .catchError((error){
      emit(SocialLoginErrorState(error.toString()));

    });



  }
  IconData suffix=Icons.visibility_outlined;
  bool isPasswordShown=true;
void ChangePasswordVisibility()
{
  isPasswordShown=!isPasswordShown;
  suffix=isPasswordShown ?Icons.visibility_outlined : Icons.visibility_off_outlined;
  emit(SocialChangePasswordVisibilityState());

}
}