
import 'package:flutter/material.dart';
//import 'package:messenger_design2/bmi_screen.dart';


class BmiResultScreen extends StatelessWidget {
 // const BmiResultScreen({Key? key}) : super(key: key);
  final  double? result;
    bool isMale;
  final int? age;

  BmiResultScreen({
   @required this.result,
    @required this.age,
     required this.isMale,

});




  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Result',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender : ${isMale ? 'Male': 'Female'}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,

              ),

            ),
            Text(
              'Result : ${result!.round()}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,

              ),

            ),
            Text(
              'Age : $age',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,

              ),

            ),

          ],
        ),
      ),

    );
  }
}
