import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/layout/social_app/social_layout.dart';
import 'package:messenger_design2/modules/social_app/social_register/cubit_register/cubit.dart';
import 'package:messenger_design2/modules/social_app/social_register/cubit_register/states.dart';
import 'package:messenger_design2/shared/components/components.dart';


class SocialRegisterScreen extends StatelessWidget {
  //const SocialRegisterScreen({Key? key}) : super(key: key);
  var formKey=GlobalKey<FormState>();
  var emailController=TextEditingController();
  var password1Controller=TextEditingController();
  var nameController=TextEditingController();
  var phoneController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit,SocialRegisterStates>(
        listener: (context,state)
        {

          if(state is SocialCreateUserSuccessState)
            {
              
              navigateAndFinish(context, SocialLayout());


              
            }

          //if(state is SocialRegisterSuccessState)
          // {
          //   token=state.loginModel.data.token;
          //   SocialCubit.get(context).currentIndex=0;
          //   if(state.loginModel.status)
          //   {
          //    // print(state.loginModel.message);
          //    // print(state.loginModel.data.token);
          //     //text=state.loginModel.message;
          //
          //    // token = CacheHelper.getData(key: 'token')??'';
          //     CacheHelper.saveDtata(key: 'token', value: state.loginModel.data.token).then((value){
          //       token=state.loginModel.data.token;
          //       userCall(context);
          //
          //       navigateAndFinish(context, SocialLayout());
          //     });
          //     // navigateTo(context, SocialLayout());
          //
          //     // Toast.show(state.loginModel.message, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
          //     // Fluttertoast.showToast(
          //     //   msg: state.loginModel.message,
          //     //   toastLength: Toast.LENGTH_LONG,
          //     //   gravity: ToastGravity.BOTTOM,
          //     //   timeInSecForIosWeb: 5,
          //     //   backgroundColor: Colors.green,
          //     //   textColor: Colors.white,
          //     //   fontSize: 16.0,
          //     // );
          //
          //
          //   }
          //   else
          //   {
          //
          //
          //     print(state.loginModel.message);
          //     print(state.loginModel.status);
          //     //text=state.loginModel.message;
          //     // Toast.show(state.loginModel.message, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
          //
          //     // Fluttertoast.showToast(
          //     //     msg: state.loginModel.message,
          //     //     toastLength: Toast.LENGTH_LONG,
          //     //     gravity: ToastGravity.BOTTOM,
          //     //     timeInSecForIosWeb: 5,
          //     //     backgroundColor: Colors.red,
          //     //     textColor: Colors.white,
          //     //     fontSize: 16.0,
          //     // );
          //
          //     // Fluttertoast.showToast(
          //     //     msg: state.loginModel.message,
          //     //     toastLength: Toast.LENGTH_LONG,
          //     //     gravity: ToastGravity.BOTTOM,
          //     //     timeInSecForIosWeb:5, // for ios and web
          //     //     backgroundColor: Colors.white,
          //     //     textColor: Colors.red,
          //     //     fontSize: 16.0
          //     // );
          //   }
          //
          //
          // }

        },
        builder: (context,state)
        {
          return Scaffold(
            appBar: AppBar(),
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
                          'Register',
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Register now to communicate with friends',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        defaultFormField(

                            prefix: Icons.person,
                            type: TextInputType.name,
                            controller: nameController,
                            validate: ( value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'Please Enter your name';
                              }
                            },
                            label: 'Name'
                        ),
                        SizedBox(height: 20.0,),
                        defaultFormField(

                            prefix: Icons.email,
                            type: TextInputType.emailAddress,
                            controller: emailController,
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
                          isPassword: SocialRegisterCubit.get(context).isPasswordShown,
                          suffix: SocialRegisterCubit.get(context).suffix,
                          sufficfunction: ()
                          {
                            SocialRegisterCubit.get(context).ChangePasswordVisibility();
                          },
                          // onSubmit: (value)
                          // {
                          //   if(formKey.currentState!.validate())
                          //   {
                          //     SocialRegisterCubit.get(context).UserRegister(email: emailController.text, password: password1Controller.text);
                          //
                          //   }
                          //
                          // },
                        ),
                        SizedBox(height: 20.0,),
                        defaultFormField(

                          prefix: Icons.phone,
                          type: TextInputType.phone,
                          controller: phoneController,
                          validate: ( value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'Please Enter your Phone number';
                            }
                          },
                          label: 'Phone',
                          // isPassword: SocialRegisterCubit.get(context).isPasswordShown,
                          // suffix: SocialRegisterCubit.get(context).suffix,
                          //  sufficfunction: ()
                          //  {
                          //    SocialRegisterCubit.get(context).ChangePasswordVisibility();
                          //  },
                          //  onSubmit: (value)
                          //  {
                          //    if(formKey.currentState!.validate())
                          //    {
                          //      SocialRegisterCubit.get(context).UserRegister(email: emailController.text, password: password1Controller.text);
                          //
                          //    }
                          //
                          //  },
                        ),
                        SizedBox(height: 20.0,),
                        ConditionalBuilder(
                          condition: state is! SocialRegisterLoadingState,
                          builder: (context)=>defaultButton(
                            function: ()
                            {
                              if(formKey.currentState!.validate())
                              {
                                SocialRegisterCubit.get(context).UserRegister(
                                  name: nameController.text,
                                    email: emailController.text,
                                    password: password1Controller.text,
                                    phone: phoneController.text,

                                );

                              }




                            },
                            text: 'Register',
                            isUpperCase: true,
                          ),
                          fallback:(context)=> Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(height: 20.0,),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text('Don\'t have an account register now',),
                        //     SizedBox(width: 5.0,),
                        //     TextButton(
                        //       onPressed: ()
                        //       {
                        //         navigateTo(context, SocialRegisterScreen());
                        //
                        //       },
                        //       child: Text('Register now',style: TextStyle(fontSize: 16.0),),
                        //     ),
                        //
                        //
                        //   ],
                        // ),
                        // SizedBox(height: 20.0,),
                        //
                        //
                        // text=='Register done successfully'?  Text(
                        //   '$text',
                        //   style: TextStyle(
                        //     color: Colors.green,
                        //     fontSize: 16,
                        //   ),
                        // ):
                        // Text(
                        //
                        //   '$text',
                        //   style: TextStyle(
                        //     color: Colors.red,
                        //     fontSize: 16,
                        //
                        //
                        //
                        //   ),
                        // ),


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
  // void userCall(context)
  // {
  //   SocialCubit.get(context).getHomeData();
  //   SocialCubit.get(context).getFavorites();
  //   SocialCubit.get(context).getCategories();
  //   SocialCubit.get(context).getUserData();
  //
  //
  //
  // }
}
