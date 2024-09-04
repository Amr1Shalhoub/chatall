import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/layout/cubit/states.dart';
//import 'package:messenger_design2/modules/business/business_screen.dart';
import 'package:messenger_design2/modules/news_app/business/business_screen.dart';
import 'package:messenger_design2/modules/news_app/science/science_screen.dart';
import 'package:messenger_design2/modules/news_app/sports/sports_screen.dart';
//import 'package:messenger_design2/modules/science/science_screen.dart';
import 'package:messenger_design2/modules/settings/settings_screen.dart';
//import 'package:messenger_design2/modules/sports/sports_screen.dart';
import 'package:messenger_design2/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit(): super(NewsInitialState());

  static NewsCubit get(context)=> BlocProvider.of(context);


  int currentindex=0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon:Icon(
        Icons.business,
      ),
      label: 'Business'
    ),
    BottomNavigationBarItem(
        icon:Icon(
          Icons.sports,
        ),
        label: 'Sports'
    ),
    BottomNavigationBarItem(
        icon:Icon(
          Icons.science,
        ),
        label: 'Science'
    ),
    BottomNavigationBarItem(
        icon:Icon(
          Icons.settings,
        ),
        label: 'Settings'
    ),
  ];
  List<Widget> screens=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];
  void ChangeBottomNavBar(int index)
  {
    currentindex=index;

    if(currentindex==1)
    {
      getSports();
    }
    if(currentindex==2)
    {
      getScience();
    }

    emit(NewsBottomNavState());
  }

List<dynamic> business=[];
  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());

      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'business',
          'apiKey':'cd23a9a54d62445283793b029ad55897',

        } ,).then((value) {
        //print(value.data['articles'][0]['title']);
        business = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetBusinessErrorState(error.toString()));
      });


  }
  List<dynamic> sports=[];
  void getSports()
  {
    emit(NewsGetSportsLoadingState());
    if(sports.length==0)
      {
        DioHelper.getData(
          url: 'v2/top-headlines',
          query:
          {
            'country':'eg',
            'category':'sports',
            'apiKey':'cd23a9a54d62445283793b029ad55897',

          } ,).then((value) {
          //print(value.data['articles'][0]['title']);
          sports = value.data['articles'];
          print(sports[0]['title']);
          emit(NewsGetSportsSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(NewsGetSportsErrorState(error.toString()));
        });

      }else
      {
        emit(NewsGetSportsSuccessState());
      }





  }
  List<dynamic> science=[];
  void getScience()
  {
    emit(NewsGetScienceLoadingState());
    if(science.length==0)
      {
        DioHelper.getData(
          url: 'v2/top-headlines',
          query:
          {
            'country':'eg',
            'category':'science',
            'apiKey':'cd23a9a54d62445283793b029ad55897',

          } ,).then((value) {
          //print(value.data['articles'][0]['title']);
          science = value.data['articles'];
          print(science[0]['title']);
          emit(NewsGetScienceSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(NewsGetScienceErrorState(error.toString()));
        });


      }else
      {
        emit(NewsGetScienceSuccessState());
      }




  }
  List<dynamic> search=[];
  void getSearch(String value)
  {

    emit(NewsGetSearchLoadingState());
   // search=[];
    DioHelper.getData(
      url: 'v2/everything',
      query:
      {
       // 'country':'eg',
        'q':'$value',
        'apiKey':'cd23a9a54d62445283793b029ad55897',

      } ,).then((value) {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });





  }

}