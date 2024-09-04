// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:messenger_design2/layout/social_app/cubit/cubit.dart';
// import 'package:messenger_design2/layout/social_app/cubit/states.dart';
// import 'package:messenger_design2/models/social_app/message_model.dart';
// import 'package:messenger_design2/models/social_app/social_user_model.dart';
// import 'package:messenger_design2/shared/styles/colors.dart';
//
// class ChatDetailsScreen extends StatelessWidget {
//  // const ChatDetailsScreen({Key? key}) : super(key: key);
//
//   @override
//  late SocialUserModel userModel;
//   ChatDetailsScreen({
//     required this.userModel
// });
//   var messageController=TextEditingController();
//
//
//   Widget build(BuildContext context) {
//     return Builder(
//       builder: (BuildContext context) {
//         SocialCubit.get(context).getMessages(receiverId: userModel.uId);
//
//         return  BlocConsumer<SocialCubit, SocialStates>(
//           listener: (context,state) {},
//           builder: (context,state) {
//
//             return Scaffold(
//
//               appBar: AppBar(
//                 titleSpacing: 0.0,
//                 title: Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 20.0,
//                       backgroundImage: NetworkImage('${userModel.image}'),
//                     ),
//                     SizedBox(width: 15.0,),
//                     Text('${userModel.name}')
//                   ],
//                 ),
//               ),
//
//               body: ConditionalBuilder(
//                 condition: SocialCubit.get(context).messages.length>0,
//                 builder: (context)=>Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//
//
//                     children: [
//
//
//
//                       ListView.separated
//                         (
//                         physics: BouncingScrollPhysics(),
//                           shrinkWrap: true,
//
//                           itemBuilder: (context,index)
//                           {
//                             var message=SocialCubit.get(context).messages[index];
//                             if(SocialCubit.get(context).userModel.uId ==message.senderId)
//                               return buildMyMessage(message);
//
//                             return buildMessage(message);
//
//                           },
//                           separatorBuilder: (context,index)=>SizedBox(height: 15.0,),
//                           itemCount: SocialCubit.get(context).messages.length),
//                       Spacer(),
//
//                       Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                               color: Colors.grey,
//                               width: 1.0
//
//                           ),
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                         clipBehavior: Clip.antiAliasWithSaveLayer,
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left:15.0),
//                                 child: TextFormField(
//                                   keyboardType: TextInputType.text,
//                                   controller: messageController,
//
//                                   decoration: InputDecoration.collapsed(
//                                       border: InputBorder.none,
//                                       hintText: ' Type your message here ...'
//
//                                   ),
//
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               height: 50.0,
//                               color: defaultColor,
//                               child: MaterialButton(onPressed: ()
//                               {
//                                 SocialCubit.get(context).sendMessage(
//                                   receiverId: userModel.uId,
//                                   dateTime: DateTime.now().toString(),
//                                   text: messageController.text,
//                                 );
//                                 messageController.text='';
//
//                               },
//                                 minWidth: 1.0,
//                                 child: Icon(Icons.send,color: Colors.white,),
//
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//
//
//
//
//                     ],
//                   ),
//                 ),
//                fallback: (context)=>Center(child: CircularProgressIndicator()),
//               ),
//             );
//           },
//
//
//         );
//
//       },
//
//     );
//   }
//
//
//   Widget buildMessage(MessageModel model)=>  Align(
//     alignment: AlignmentDirectional.centerStart,
//     child: Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[300],
//         borderRadius: BorderRadiusDirectional.only(
//           bottomEnd:Radius.circular(10.0),
//           topEnd:Radius.circular(10.0),
//           topStart:Radius.circular(10.0),
//
//         ),
//
//       ),
//       padding: EdgeInsets.symmetric(vertical: 5.0,horizontal:10.0 ),
//       child: Text('${model.text}'),
//
//     ),
//   );
//
//   Widget buildMyMessage(MessageModel model)=>  Align(
//     alignment: AlignmentDirectional.centerEnd,
//     child: Container(
//       decoration: BoxDecoration(
//         color: defaultColor.withOpacity(.2),
//         borderRadius: BorderRadiusDirectional.only(
//           bottomStart:Radius.circular(10.0),
//           topEnd:Radius.circular(10.0),
//           topStart:Radius.circular(10.0),
//
//         ),
//
//       ),
//       padding: EdgeInsets.symmetric(vertical: 5.0,horizontal:10.0 ),
//       child: Text('${model.text}'),
//
//     ),
//   );
//
//
// }




import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/layout/social_app/cubit/cubit.dart';
import 'package:messenger_design2/layout/social_app/cubit/states.dart';
import 'package:messenger_design2/models/social_app/message_model.dart';
import 'package:messenger_design2/models/social_app/social_user_model.dart';
import 'package:messenger_design2/shared/styles/colors.dart';

class ChatDetailsScreen extends StatelessWidget {
  // const ChatDetailsScreen({Key? key}) : super(key: key);

  @override
  late SocialUserModel userModel;
  ChatDetailsScreen({
    required this.userModel
  });
  var messageController=TextEditingController();


  Widget build(BuildContext context) {
    return Builder(

      builder: (BuildContext context) {
        var mediaquery=MediaQuery.of(context);

        SocialCubit.get(context).getMessages(receiverId: userModel.uId);

        return  BlocConsumer<SocialCubit, SocialStates>(
          listener: (context,state) {},
          builder: (context,state) {

            return Scaffold(

              appBar: AppBar(
                titleSpacing: 0.0,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: CachedNetworkImageProvider('${userModel.image}'),
                    ),
                    SizedBox(width: 15.0,),
                    Text('${userModel.name}')
                  ],
                ),
              ),

              body: ConditionalBuilder(
                condition: SocialCubit.get(context).messages.length>0,
                builder: (context)=>Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                   //alignment: Alignment.topCenter,
                    children: [
                      Expanded(
                        child: ListView.separated
                          (
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,

                            itemBuilder: (context,index)
                            {
                              var message=SocialCubit.get(context).messages[index];
                              if(SocialCubit.get(context).userModel.uId ==message.senderId)
                                return buildMyMessage(message);

                              return buildMessage(message);

                            },
                            separatorBuilder: (context,index)=>SizedBox(height: 15.0,),
                            itemCount: SocialCubit.get(context).messages.length),
                      ),
                     // SizedBox(height: 100,),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              width: 1.0

                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          width: mediaquery.size.width *0.9,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left:15.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: messageController,

                                    decoration: InputDecoration.collapsed(
                                        border: InputBorder.none,
                                        hintText: ' Type your message here ...'

                                    ),

                                  ),
                                ),
                              ),
                              Container(
                                height: 50.0,
                                color: defaultColor,
                                child: MaterialButton(onPressed: ()
                                {
                                  SocialCubit.get(context).sendMessage(
                                    receiverId: userModel.uId,
                                    dateTime: DateTime.now().toString(),
                                    text: messageController.text,
                                  );
                                  messageController.text='';

                                },
                                  minWidth: 1.0,
                                  child: Icon(Icons.send,color: Colors.white,),

                                ),
                              )
                            ],
                          ),
                        ),
                      ),






                    ],
                  ),
                ),
                fallback: (context)=>Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Spacer(),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              width: 1.0

                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          width: mediaquery.size.width *0.9,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left:15.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: messageController,

                                    decoration: InputDecoration.collapsed(
                                        border: InputBorder.none,
                                        hintText: ' Type your message here ...'

                                    ),

                                  ),
                                ),
                              ),
                              Container(
                                height: 50.0,
                                color: defaultColor,
                                child: MaterialButton(onPressed: ()
                                {
                                  SocialCubit.get(context).sendMessage(
                                    receiverId: userModel.uId,
                                    dateTime: DateTime.now().toString(),
                                    text: messageController.text,
                                  );
                                  messageController.text='';

                                },
                                  minWidth: 1.0,
                                  child: Icon(Icons.send,color: Colors.white,),

                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                )

                    //Center(child: CircularProgressIndicator()),
              ),
            );
          },


        );

      },

    );
  }


  Widget buildMessage(MessageModel model)=>  Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd:Radius.circular(10.0),
          topEnd:Radius.circular(10.0),
          topStart:Radius.circular(10.0),

        ),

      ),
      padding: EdgeInsets.symmetric(vertical: 5.0,horizontal:10.0 ),
      child: Text('${model.text}'),

    ),
  );

  Widget buildMyMessage(MessageModel model)=>  Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
      decoration: BoxDecoration(
        color: defaultColor.withOpacity(.2),
        borderRadius: BorderRadiusDirectional.only(
          bottomStart:Radius.circular(10.0),
          topEnd:Radius.circular(10.0),
          topStart:Radius.circular(10.0),

        ),

      ),
      padding: EdgeInsets.symmetric(vertical: 5.0,horizontal:10.0 ),
      child: Text('${model.text}'),

    ),
  );


}
