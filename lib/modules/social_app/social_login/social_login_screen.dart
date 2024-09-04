import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/layout/social_app/social_layout.dart';
import 'package:messenger_design2/modules/social_app/social_login/cubit/cubit.dart';
import 'package:messenger_design2/modules/social_app/social_login/cubit/states.dart';
import 'package:messenger_design2/modules/social_app/social_register/social_register_screen.dart';
import 'package:messenger_design2/shared/components/components.dart';
import 'package:messenger_design2/shared/network/local/cache_helper.dart';

class SocialLoginScreen extends StatelessWidget {
 // const SocialLoginScreen({Key? key}) : super(key: key);

  @override

  var formKey=GlobalKey<FormState>();
  var email1Controller=TextEditingController();
  var password1Controller=TextEditingController();

  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context);
    String text='';
    return  BlocProvider(
      create: (BuildContext context)=>SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit,SocialLoginStates>(
        listener:(context,state) {

          if(state is SocialLoginSuccessState)
            {
              CacheHelper.saveDtata(key: 'uId', value:state.uId).then((value)  {
                navigateAndFinish(context, SocialLayout());



              });



            }





        } ,
        builder: (context,state){
          return  Scaffold(
            appBar: AppBar(

            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Log in now to communicate with friends',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        defaultFormField(

                            prefix: Icons.email,
                            type: TextInputType.emailAddress,
                            controller: email1Controller,
                            validate: ( value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'Please Enter your email address';
                              }
                            },
                            label: 'Email Address'
                        ),
                        SizedBox(height: 30.0,),
                        defaultFormField(

                          prefix: Icons.lock_outline,
                          type: TextInputType.visiblePassword,
                          controller: password1Controller,
                          validate: ( value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'Please Enter your password';
                            }
                          },
                          label: 'Password',
                          isPassword: SocialLoginCubit.get(context).isPasswordShown,
                          suffix: SocialLoginCubit.get(context).suffix,
                          sufficfunction: ()
                          {
                            SocialLoginCubit.get(context).ChangePasswordVisibility();
                          },
                          onSubmit: (value)
                          {
                            if(formKey.currentState!.validate())
                            {
                              // SocialLoginCubit.get(context).UserLogin(email: email1Controller.text, password: password1Controller.text);

                            }

                          },
                        ),
                        SizedBox(height: 20.0,),
                        ConditionalBuilder(
                          condition: state is! SocialLoginLoadingState,
                          builder: (context)=>defaultButton(
                            function: ()
                            {

                              if(formKey.currentState!.validate())
                              {
                                 SocialLoginCubit.get(context).UserLogin(email: email1Controller.text, password: password1Controller.text);
                                // state is SocialLoginLoadingState;
                                // emit(SocialLoginLoadingState());

                              }




                            },
                            text: 'Login',
                            isUpperCase: true,
                          ),
                          fallback:(context)=> Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(height: 20.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Text('Don\'t have an account register now',

                            ),
                            SizedBox(width: 5.0,),



                          ],
                        ),
                        SizedBox(height: 20.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: ()
                              {
                                navigateTo(context, SocialRegisterScreen());

                              },
                              child: Text('Register now',style: TextStyle(fontSize: 16.0),),
                            ),
                          ],
                        ),


                        text=='Login done successfully'?  Text(
                          '$text',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ):
                        Text(

                          '$text',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,



                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
