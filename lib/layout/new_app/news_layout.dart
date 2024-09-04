import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/layout/cubit/cubit.dart';
import 'package:messenger_design2/layout/cubit/states.dart';
import 'package:messenger_design2/modules/news_app/search/search_screen.dart';
//import 'package:messenger_design2/modules/search/search_screen.dart';
import 'package:messenger_design2/shared/components/components.dart';
import 'package:messenger_design2/shared/cubit/cubit.dart';
import 'package:messenger_design2/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'New App',
            ),
            actions:
            [
              IconButton(
                  onPressed:()
                  {
                    navigateTo(context, SearchScreen(),);
                  },
                  icon:Icon(Icons.search)
              ),
              IconButton(
                  onPressed:()
                  {
                    AppCubit.get(context).ChangeAppMode();
                  },
                  icon:Icon(Icons.brightness_4_outlined),
              ),

            ],

          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: ()
          //   {
          //     DioHelper.getData(
          //         url: 'v2/top-headlines',
          //         query:
          //         {
          //           'country':'eg',
          //           'category':'Business',
          //           'apiKey':'cd23a9a54d62445283793b029ad55897',
          //
          //         } ,).then((value) {
          //           print(value.data['articles'][0]['title']);
          //     }).catchError((error){
          //       print(error.toString());
          //     });
          //   },
          //   child: Icon(Icons.add),
          // ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentindex,
            onTap: (index)
            {
              cubit.ChangeBottomNavBar(index);

            },
            items:cubit.bottomItems,

          ),
          body: cubit.screens[cubit.currentindex],
        );
      },

    );
  }
}
