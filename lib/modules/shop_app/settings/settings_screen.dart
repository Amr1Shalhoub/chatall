import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/layout/shop_app/shop_app_cubit/cubit.dart';
import 'package:messenger_design2/layout/shop_app/shop_app_cubit/states.dart';
import 'package:messenger_design2/shared/components/components.dart';
import 'package:messenger_design2/shared/components/constants.dart';




class SettingsScreen extends StatelessWidget {
 // const SettingsScreen({Key? key}) : super(key: key);
  var formkey=GlobalKey<FormState>();
  var emailController=TextEditingController();
  var phonelController=TextEditingController();
  var nameController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener:(context,state)
      {


      },

      builder:(context,state){
        var model=ShopCubit.get(context).userModel;
       // model.data.token=token;
        nameController.text=model.data.name;
        phonelController.text=model.data.phone;
        emailController.text=model.data.email;
        print(model.data.token);

        return  ConditionalBuilder(
          condition: ShopCubit.get(context).userModel.status!=false&&state is! ShopErrorUserDataState,
          builder: (context)=>Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formkey,
              child: Column(

                children: [
                  if(state is ShopLoadingUpdateUserState)
                  LinearProgressIndicator(),
                  SizedBox(height: 20.0,),

                  defaultFormField(
                      prefix: Icons.person,
                      type: TextInputType.name,
                      controller: nameController,
                      validate: ( value)
                      {
                        if(value!.isEmpty){
                          return 'Name must not be empty';
                        }
                        return null;
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
                        if(value!.isEmpty){
                          return 'Email must not be empty';
                        }
                        return null;
                      },
                      label: 'Email Address'
                  ),
                  SizedBox(height: 20.0,),
                  defaultFormField(
                      prefix: Icons.phone,
                      type: TextInputType.phone,
                      controller: phonelController,
                      validate: ( value)
                      {
                        if(value!.isEmpty){
                          return 'Phone Number must not be empty';
                        }
                        return null;
                      },
                      label: 'Phone'
                  ),
                  SizedBox(height: 20.0,),
                  defaultButton(
                      function: (){

                        Siginout(context);
                      },
                      text: 'Logout'
                  ),
                  SizedBox(height: 20.0,),
                  defaultButton(
                      function: (){

                        if(formkey.currentState!.validate())
                        {
                          ShopCubit.get(context).updateUserData(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phonelController.text,
                          );
                        }



                      },
                      text: 'Update'
                  ),

                ],
              ),
            ),
          ),
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        );
      },

    );
  }
}
