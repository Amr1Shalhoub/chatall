import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/layout/social_app/cubit/cubit.dart';
import 'package:messenger_design2/layout/social_app/cubit/states.dart';
import 'package:messenger_design2/modules/social_app/new_post/new_post_screen.dart';
import 'package:messenger_design2/shared/components/components.dart';


class SocialLayout extends StatelessWidget {
  //const SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){

        if(state is SocialNewPoststate)
          {
            navigateTo(context, NewPostScreen());
          }
      },
      builder: (context,state){
        var cubit = SocialCubit.get(context);

        return Scaffold(
          appBar: AppBar(

            title:Text(
              cubit.titles[cubit.currentindex],

            ),
            actions: [

              // IconButton(onPressed: (){
              //
              //   navigateTo(context, NewPostScreen());
              //
              //
              // }, icon: Icon(Icons.add_circle_outline,color: defaultColor,),
              // ),

              IconButton(onPressed: (){


              }, icon: Icon(Icons.notifications_outlined),
              ),
              IconButton(onPressed: (){


              }, icon: Icon(Icons.search),),


            ],



          ),
          body: cubit.screens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentindex,

            onTap: (index){
              cubit.ChangeBottomNav(index);



            },
            items: [


              BottomNavigationBarItem(icon: Icon(

              // IconBroken.Home,
                Icons.home_filled,
              ),
                label: 'Home'
              ),
              BottomNavigationBarItem(icon: Icon(

               // IconBroken.Chat,
                Icons.chat_bubble,
              ),
                label: 'Chat'
              ),
              BottomNavigationBarItem(icon: Icon(

                // IconBroken.Chat,
                Icons.add_circle_outline,
              ),
                  label: 'Post'
              ),

              BottomNavigationBarItem(icon: Icon(

               // IconBroken.Location,
                Icons.supervised_user_circle,
              ),
                label: 'Users'
              ),

              BottomNavigationBarItem(icon: Icon(

              //  IconBroken.Setting,
                Icons.settings,
              ),
                label: 'Settings'
              ),


            ],

          ),



        );
      },


    );
  }
}


