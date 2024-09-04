import 'package:flutter/material.dart';
import 'package:messenger_design2/modules/shop_app/login/shop_login_screen.dart';
import 'package:messenger_design2/shared/components/components.dart';
import 'package:messenger_design2/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:messenger_design2/shared/network/local/cache_helper.dart';





class BoardingModel
{
  final String image;
  final String title;
  final String body;
  BoardingModel({
    required this.image,
    required this.title,
    required this.body,

  });
}




class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //const OnBoardingScreen({Key? key}) : super(key: key);
  var boardController = PageController();

  List<BoardingModel> boarding =[
    BoardingModel(image:'assets/images/on_boarding.jpg' ,
    title: 'On Board 1',
      body: 'On Board body 1',


    ),
    BoardingModel(image:'assets/images/on_boarding.jpg' ,
      title: 'On Board 2',
      body: 'On Board body 2',


    ),
    BoardingModel(image:'assets/images/on_boarding.jpg' ,
      title: 'On Board 3',
      body: 'On Board body 3',


    ),

  ];
  bool isLast=false;
  void Submit()
  {
    CacheHelper.saveDtata(key: 'onBoarding', value: true).then
      ((value) {
        if(value)
      navigateAndFinish(context,ShopLoginScreen(), );
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed:()
          {
           Submit();



          } , child: Text(
              'SKIP',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
          ),
          )
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder:(context,index)=>buildBoardingItem(boarding[index]),
              itemCount: boarding.length,
                onPageChanged: (index)
                {
                  if(index==boarding.length-1)
                    {
                      setState(() {
                        isLast=true;
                      });
                      print('Last');
                    }
                  else{
                    setState(() {
                      isLast=false;
                    });
                  }
                },
              ),
            ),
            SizedBox(height: 40.0,),
            Row(
              children: [

                SmoothPageIndicator(
                    controller: boardController,
                    count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: defaultColor,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5.0,


                  ),
                ),

                Spacer(),


                FloatingActionButton(onPressed: ()
                {
                  if(isLast==true){
                    Submit();

                  }
                  else
                  {
                    boardController.nextPage(
                      duration: Duration(
                        microseconds: 500,
                        seconds: 1,
                      ),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );

                  }


                },
                  child: Icon(Icons.arrow_forward_ios),
                ),

              ],
            )
          ],

        ),
      ),
    );

  }

  Widget buildBoardingItem(BoardingModel model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image:AssetImage('${model.image}'),
        ),
      ),
      SizedBox(height: 30.0,),
      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,


        ),
      ),
      SizedBox(height: 15.0,),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize:14.0,
          fontWeight: FontWeight.bold,


        ),
      ),
      SizedBox(height: 20.0,),

    ],
  );
}
