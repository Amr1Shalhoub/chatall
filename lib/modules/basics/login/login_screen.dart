
import 'package:flutter/material.dart';
import 'package:messenger_design2/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
 // const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  var formkey=GlobalKey<FormState>();
  bool passwordsecure = true;
  bool isPasswordShow=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(

            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                  SizedBox(height: 40.0,),
                  // TextFormField(
                  //   controller: emailController,
                  //   keyboardType: TextInputType.emailAddress,
                  //   onFieldSubmitted: (value){
                  //     print(value);
                  //
                  //   },
                  //   onChanged: (value){
                  //     print(value);
                  //
                  //   },
                  //   validator: (value){
                  //     if(value!.isEmpty)
                  //       {
                  //         return 'The email address must not be empty';
                  //       }
                  //     return null;
                  //   },
                  //
                  //   decoration: InputDecoration(
                  //
                  //     labelText: 'Email',
                  //     border:OutlineInputBorder(),
                  //     prefixIcon: Icon(
                  //       Icons.email,
                  //     )
                  //
                  //   ),
                  // ),
                defaultFormField(
                    prefix: Icons.email,
                    type: TextInputType.emailAddress,
                    controller: emailController,
                    onChange: (value){
                      print(value);
                    },
                    label: 'Email Adress',
                  validate:(value){
                    if(value!.isEmpty)
                    {
                      return 'The email address must not be empty';
                    }
                    return null;
                  },
                  onSubmit: (value){
                      print(value);
                  },
                ),
                  SizedBox(height: 20.0,),


                  defaultFormField(
                    prefix: Icons.lock,
                    type: TextInputType.visiblePassword,
                    controller: passwordController,
                    onChange: (value){
                      print(value);
                    },
                    label: 'Password',
                    validate:(value){
                      if(value!.isEmpty)
                      {
                        return 'Password must not be empty';
                      }
                      return null;
                    },
                    onSubmit: (value){
                      print(value);
                    },
                    isPassword: isPasswordShow,
                    sufficfunction: (){
                      setState(() {
                        isPasswordShow=!isPasswordShow;

                      });


                    },
                    suffix: !isPasswordShow ? Icons.visibility :Icons.visibility_off,

                  ),
                //   SizedBox(height: 20.0,),
                  // defaultFormField(
                  //     prefix: Icons.email,
                  //     type: TextInputType.emailAddress,
                  //     controller: emailController,
                  //     // validate: (){
                  //     //   if(emailController.text!.isEmpty)
                  //     //   {
                  //     //     return 'The email address must not be empty';
                  //     //   }
                  //     //   return null;
                  //     // },
                  //
                  //
                  //     label: 'Email',
                  //   onChange: (){
                  //       print('a');
                  //   },
                  //
                  //   // onChange: (value){
                  //   //     print(value);
                  //   // }
                  //   // onChange: (String value){
                  //   //     print(value);
                  //   // },
                  //   // validate: (value){
                  //   //   if(value!.isEmpty)
                  //   //   {
                  //   //     return 'The email address must not be empty';
                  //   //   }
                  //   //   return '';
                  //   // },
                  // ),
               //   SizedBox(height: 20.0,),
               /*   defaultformfield(
                    controller: emailController,
                    label:'Email address',
                    prefix: Icons.email,
                    type: TextInputType.emailAddress,
                    // validate: (String value){
                    //   if(value.isEmpty){
                    //     return 'Email must not be empty';
                    //
                    //   }
                    //   return null;
                    // },
                    // onSubmit: ( value){
                    //   print(value);
                    // },
                    // onChange: (value){
                    //   print(value);
                    // }


                  ),*/
                //  SizedBox(height: 20.0,),
                //   TextFormField(
                //     obscureText: passwordsecure,
                //     controller: passwordController,
                //     keyboardType: TextInputType.visiblePassword,
                //     onFieldSubmitted: (value){
                //       print(value);
                //
                //     },
                //     onChanged: (value){
                //       print(value);
                //
                //     },
                //     validator: (value){
                //       if(value!.isEmpty)
                //       {
                //         return 'The password must not be empty';
                //       }
                //       return null;
                //     },
                //
                //     decoration: InputDecoration(
                //
                //         labelText: 'Password',
                //         border:OutlineInputBorder(),
                //         prefixIcon: Icon(
                //           Icons.lock,
                //         ),
                //       suffixIcon: IconButton(
                //         icon:passwordsecure ? Icon(Icons.visibility): Icon(Icons.visibility_off),
                //           onPressed:(){
                //           setState(() {
                //          passwordsecure=!passwordsecure;
                //
                //           });
                //
                //           } ,
                //
                //       ),
                //
                //
                //       // suffixIcon: Icon(
                //       //
                //       //   Icons.remove_red_eye,
                //       // ),
                //
                //     ),
                //   ),

                  SizedBox(height: 20.0,),
                  CustomButton(
                      text: 'Login',
                    //  backgroundcolor: Colors.red,
                      onpress: (){
                      //  print('a');
                        if(formkey.currentState!.validate())
                        {
                          print(emailController.text);
                          print(passwordController.text);

                        }

                      }
                  ),



                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\t have an account ?',
                        style: TextStyle(
                          fontSize: 16.0,

                        ),
                      ),
                      TextButton(
                          onPressed:(){

                          },
                          child: Text(
                            'Register now',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),

                          )
                      )
                    ],
                  )

                ],

              ),
            ),
          ),
        ),
      ),

    );
  }
}
