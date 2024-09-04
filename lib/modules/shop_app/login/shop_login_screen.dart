import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/layout/shop_app/shop_app_cubit/cubit.dart';
//import 'package:messenger_design2/layout/shop_app/shop_app_cubit/states.dart';
//import 'package:messenger_design2/layout/shop_app/shop_app_cubit/states.dart';
import 'package:messenger_design2/layout/shop_app/shop_layout.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:messenger_design2/modules/shop_app/login/cubit/cubit.dart';
import 'package:messenger_design2/modules/shop_app/login/cubit/states.dart';
import 'package:messenger_design2/shared/components/components.dart';
import 'package:messenger_design2/modules/shop_app/register/shop_register_screen.dart';
import 'package:messenger_design2/shared/components/constants.dart';
//import 'package:messenger_design2/shared/cubit/states.dart';
import 'package:messenger_design2/shared/network/local/cache_helper.dart';
//import 'package:toast/toast.dart';
//import 'package:messenger_design2/layout/shop_app/shop_app_cubit/cubit.dart';


class ShopLoginScreen extends StatelessWidget {
 // const ShopLoginScreen({Key? key}) : super(key: key);
  var formKey=GlobalKey<FormState>();
  var email1Controller=TextEditingController();
  var password1Controller=TextEditingController();
  int homekey=0;
  VoidCallback? user;



  @override
  Widget build(BuildContext context) {

    String text='';

    return BlocProvider(
      create: (BuildContext context) =>ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener: (context,state)
        {
          if(state is ShopLoginSuccessState)
            {
              token=state.loginModel.data.token;
              ShopCubit.get(context).currentIndex=0;
             // userCall(context);

              if(state.loginModel.status)
              {
              //  print(state.loginModel.message);
              //  print(state.loginModel.data.token);
               // text=state.loginModel.message;


                CacheHelper.saveDtata(key: 'token', value: state.loginModel.data.token).then((value)  {
                  userCall(context);
                 // userCaller(context);
                  //userhome(context);


                  //print(token);
                 // print( CacheHelper.getData(key: 'token'));

                  //state is AppInitialState;

                  navigateAndFinish(context, ShopLayout());














                  // if(homekey!=5)
                  //   {
                  //     userCall(context);
                  //   }
                  // if(homekey==5)
                  //   {
                  //
                  //     navigateAndFinish(context, ShopLayout());
                  //   }



                 // state is ShopLoadingHomeDataState;


                //  state is ShopLoadingHomeDataState;




                //  token= CacheHelper.getData(key: 'token');


                //  state is ShopLoadingHomeDataState;


                });
               // navigateTo(context, ShopLayout());

               // Toast.show(state.loginModel.message, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                // Fluttertoast.showToast(
                //   msg: state.loginModel.message,
                //   toastLength: Toast.LENGTH_LONG,
                //   gravity: ToastGravity.BOTTOM,
                //   timeInSecForIosWeb: 5,
                //   backgroundColor: Colors.green,
                //   textColor: Colors.white,
                //   fontSize: 16.0,
                // );


              }
              else
              {


                print(state.loginModel.message);
                print(state.loginModel.status);
                text=state.loginModel.message;
               // Toast.show(state.loginModel.message, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

                // Fluttertoast.showToast(
                //     msg: state.loginModel.message,
                //     toastLength: Toast.LENGTH_LONG,
                //     gravity: ToastGravity.BOTTOM,
                //     timeInSecForIosWeb: 5,
                //     backgroundColor: Colors.red,
                //     textColor: Colors.white,
                //     fontSize: 16.0,
                // );

                // Fluttertoast.showToast(
                //     msg: state.loginModel.message,
                //     toastLength: Toast.LENGTH_LONG,
                //     gravity: ToastGravity.BOTTOM,
                //     timeInSecForIosWeb:5, // for ios and web
                //     backgroundColor: Colors.white,
                //     textColor: Colors.red,
                //     fontSize: 16.0
                // );
              }


            }
          // else if(state is ShopLoginDatanullErrorState)
          // {
          //   print(state.loginModel.message);
          // }


        },
        builder:(context,state)
        {
          return Scaffold(
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
                          'Log in now to browse our hot offers',
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
                          isPassword: ShopLoginCubit.get(context).isPasswordShown,
                          suffix: ShopLoginCubit.get(context).suffix,
                          sufficfunction: ()
                          {
                            ShopLoginCubit.get(context).ChangePasswordVisibility();
                          },
                          onSubmit: (value)
                          {
                            if(formKey.currentState!.validate())
                            {
                              ShopLoginCubit.get(context).UserLogin(email: email1Controller.text, password: password1Controller.text);

                            }

                          },
                        ),
                        SizedBox(height: 20.0,),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingState,
                          builder: (context)=>defaultButton(
                            function: ()
                            {

                              if(formKey.currentState!.validate())
                              {
                                ShopLoginCubit.get(context).UserLogin(email: email1Controller.text, password: password1Controller.text);
                                //state is ShopLoadingHomeDataState;
                                //emit(ShopLoginLoadingState());

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
                            Text('Don\'t have an account register now',),
                            SizedBox(width: 5.0,),
                            TextButton(
                              onPressed: ()
                              {
                                navigateTo(context, ShopRegisterScreen());

                              },
                              child: Text('Register now',style: TextStyle(fontSize: 16.0),),
                            ),


                          ],
                        ),
                        SizedBox(height: 20.0,),


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

  void userCall(context)
  {
    ShopCubit.get(context).getHomeData();
    ShopCubit.get(context).getFavorites();
    ShopCubit.get(context).getCategories();
    ShopCubit.get(context).getUserData();
    homekey=5;


  }
  void userhome(context)
  {
    userCall(context);
    navigateAndFinish(context, ShopLayout());
  }
  Future<void> userCaller(context)
  async {
    await{ ShopCubit.get(context).getHomeData(),
      ShopCubit.get(context).getFavorites(),
    ShopCubit.get(context).getCategories(),
    ShopCubit.get(context).getUserData(),
    };





  }

}
