

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:messenger_design2/modules/bmi_app/bmi_result/bmi_result_screen.dart';
//import 'package:messenger_design2/modules/bmi_result/bmi_result_screen.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  @override
  bool isMale=true;

  double height = 120.0;
  int weight = 40;
  int age = 20;
  //late int height1;


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator'

        ),

      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [

                  Expanded(
                    child: GestureDetector(
                      onTap: (){

                        setState(() {
                          isMale=true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isMale? Colors.blue:Colors.grey[400],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          //  Icon(Icons.ac_unit,size: 50.0,),
                            Image.asset('assets/images/male.png',height: 90.0,width: 90.0,),

                            SizedBox(height: 15.0,),
                            Text(
                              'MALE',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),

                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child:   GestureDetector(
                      onTap: (){

                        setState(() {
                          isMale=false;
                        });
                      },
                      child: Container(
                      decoration: BoxDecoration(
                        color:!isMale?Colors.blue:Colors.grey[400],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         // Icon(Icons.ac_unit,size: 50.0,),
                          Image.asset('assets/images/female.png',height: 90.0,width: 90.0,),
                          SizedBox(height: 15.0,),
                          Text(
                            'FEMALE',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),

                          )
                        ],
                      ),
                  ),
                    ),
                  ),

                ],

              ),
            ),

          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,

                      ),


                    ),
                    SizedBox(height: 5.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        Text(
                          'CM',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                    Slider(
                      value:height,
                      max: 220.0,
                      min:80.0,
                      onChanged:(value) {
                        setState(() {
                         height=value;
                        // height1=value.round();
                          print(value.round());
                        });
                       // print(value.round());

                      },
                    ),
                  ],

                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [

                 Expanded(
                   child: Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10.0),
                       color:Colors.grey[400],
                     ),
                     child: Column(
                       children: [
                         Text(
                           '$weight',
                           style: TextStyle(
                             fontSize: 40.0,
                             fontWeight: FontWeight.w400,
                           ),
                         ),
                         Text(
                           'KG',
                           style: TextStyle(
                             fontSize: 20.0,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             FloatingActionButton(

                               onPressed: (){
                                 setState(() {
                                   weight--;
                                 });

                               },
                               mini: true,
                               child:Icon(Icons.remove),
                               heroTag: (
                               'weight-'
                               ),



                             ),
                             FloatingActionButton(

                               onPressed: (){
                               setState(() {
                                 weight++;
                               });

                               },
                               mini:true,
                               child:Icon(Icons.add),
                               heroTag: (
                               'weight+'
                               ),



                             )

                           ],
                         ),
                       ],

                     ),
                   ),
                 ),
                 SizedBox(width:20.0 ,),
                 Expanded(
                   child: Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10.0),
                       color:Colors.grey[400],
                     ),
                     child: Column(
                       children: [
                         Text(
                           '$age',
                           style: TextStyle(
                             fontSize: 40.0,
                             fontWeight: FontWeight.w400,
                           ),
                         ),
                         Text(
                           'Years',
                           style: TextStyle(
                             fontSize: 20.0,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             FloatingActionButton(

                               onPressed: (){
                                 setState(() {
                                   age--;
                                 });

                               },
                               mini: true,
                               child:Icon(Icons.remove),
                               heroTag: (
                               'age-'
                               ),



                             ),
                             FloatingActionButton(

                               onPressed: (){
                                 setState(() {
                                   age++;
                                 });

                               },
                               mini:true,
                               child:Icon(Icons.add),
                               heroTag: (
                                   'age+'
                               ),



                             )

                           ],
                         ),
                       ],

                     ),
                   ),
                 ),



               ],


              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,

            child: MaterialButton(
              onPressed: (){
                double result= weight/pow(height/100,2);
                print(result.round());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=>BmiResultScreen(
                        age:age,
                        isMale: isMale,
                        result: result,
                      ),
                  ),
                );

            },
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  color: Colors.white,
                ),

              ),
              height: 60.0,
            ),
          ),

        ],
      ),
    );
  }
}
