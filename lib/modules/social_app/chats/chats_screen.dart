

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/layout/social_app/cubit/cubit.dart';
import 'package:messenger_design2/layout/social_app/cubit/states.dart';
import 'package:messenger_design2/models/social_app/social_user_model.dart';
import 'package:messenger_design2/modules/social_app/chats/chat_details/chat_details_screen.dart';
import 'package:messenger_design2/shared/components/components.dart';

class ChatsScreen extends StatelessWidget {
 // const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<SocialCubit , SocialStates>(
      listener:( context, state) {},
      builder:( context, state) {

        return ConditionalBuilder(
          condition:SocialCubit.get(context).users.length>0 ,
          builder:(context) =>  ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index) =>buildChatItem(SocialCubit.get(context).users[index],context),
              separatorBuilder: (context,index)=> myDivider(),
              itemCount: SocialCubit.get(context).users.length,
          ),
          fallback:(context) => Center(child: CircularProgressIndicator()),

        );
      } ,


    );
  }


  Widget buildChatItem(SocialUserModel model,context) => InkWell(
    onTap: ()
    {
      navigateTo(context, ChatDetailsScreen(userModel: model));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(

        children: [

          CircleAvatar(
            radius: 25.0,
            backgroundImage:CachedNetworkImageProvider(
              '${model.image}',

            ),


          ),
          SizedBox(width: 15.0,),
          Text(
            '${model.name}',
            style: TextStyle(
              height: 1.4,
            ),

          ),

          SizedBox(width: 15.0,),

          IconButton(onPressed:(){


          } , icon: Icon(Icons.more_horiz,
            size: 16.0,
          ),
          ),

        ],
      ),
    ),
  );



}
