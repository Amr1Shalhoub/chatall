import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/models/social_app/social_user_model.dart';
import 'package:messenger_design2/modules/social_app/social_register/cubit_register/states.dart';


class SocialRegisterCubit extends Cubit<SocialRegisterStates>
{
  SocialRegisterCubit():super(SocialRegisterInitialState());
  static SocialRegisterCubit get(context)=>BlocProvider.of(context);
 // late SocialLoginModel loginModel;
  void UserRegister({
    required String name,
  required String email,
    required String password,
    required String phone,


})
  {
    emit(SocialRegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value){

      UserCreate(
          uId:value.user!.uid,
        email: email,
        phone:phone,
        name:name,


      );



    }).catchError((error){
      emit(SocialRegisterErrorState(error.toString()));
      print(error.toString());

    });



  }


  void UserCreate({

    required String name,
    required String email,
    required String phone,
    required String uId,

  })
  {
    SocialUserModel model=SocialUserModel(
      email: email,
      name:name,
      uId:uId,
      phone: phone,
      cover:'https://img.freepik.com/free-vector/set-avatar-silhouettes_23-2147674173.jpg?w=740&t=st=1678526172~exp=1678526772~hmac=97c49038ebee716e0a6f47a3a06cf6d5602385471c60cf3dfb3ca772635cd428' ,
      bio:'Write your bio ...',
      image: 'https://img.freepik.com/free-vector/set-avatar-silhouettes_23-2147674173.jpg?w=740&t=st=1678526172~exp=1678526772~hmac=97c49038ebee716e0a6f47a3a06cf6d5602385471c60cf3dfb3ca772635cd428',
    );

    FirebaseFirestore.instance.collection('users').doc(uId).set(
        model.toMap()).then((value){
          emit(SocialCreateUserSuccessState());
    }).catchError((error){
      emit(SocialCreateUserErrorState(error.toString()));
    });




  }
  IconData suffix=Icons.visibility_outlined;
  bool isPasswordShown=true;
void ChangePasswordVisibility()
{
  isPasswordShown=!isPasswordShown;
  suffix=isPasswordShown ?Icons.visibility_outlined : Icons.visibility_off_outlined;
  emit(SocialRegisterChangePasswordVisibilityState());

}
}