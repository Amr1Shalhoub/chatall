import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/layout/social_app/cubit/cubit.dart';
import 'package:messenger_design2/layout/social_app/cubit/states.dart';
import 'package:messenger_design2/models/social_app/post_model.dart';
import 'package:messenger_design2/shared/styles/colors.dart';


class FeedsScreen extends StatefulWidget {
  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  // const FeedsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // SocialCubit.get(context).getStreamPosts();

    return Builder(

        builder: ( BuildContext context) {
          //SocialCubit.get(context).posts=[];
          //SocialCubit.get(context).likes=[];
          // SocialCubit.get(context).postsId=[];

          //SocialCubit.get(context).getStreamPosts();

          return BlocConsumer<SocialCubit , SocialStates >(
            listener:(context, state) {
              if(state is SocialCreatePostSuccessstate)
              {
                SocialCubit.get(context).posts=[];
                SocialCubit.get(context).likes=[];
                SocialCubit.get(context).postsId=[];
                SocialCubit.get(context).getPosts();
              }
              // if(state is SocialLiskePostSuccessState)
              //   {
              //
              //
              //   }



            } ,
            builder: (context, state) {


              return       ConditionalBuilder(
                condition: SocialCubit.get(context).userModel!=null&&SocialCubit.get(context).posts.length > 0,

                builder: (context) =>  SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(

                    children: [

                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 5.0,
                        margin:EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [

                            CachedNetworkImage(
                              imageUrl: 'https://img.freepik.com/free-photo/lawn-hand-handshake-smiling-portrait_1134-792.jpg?w=1380&t=st=1678277299~exp=1678277899~hmac=885de599fef0c8ff9642686c5dad29b714cb319f0abbbcb83cc4c893603aef07',
                              fit: BoxFit.cover,
                              height: 200.0,
                              width: double.infinity,
                            ),





                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Communicate with friends',
                                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                  color: Colors.black,
                                ),

                              ),
                            )
                          ],
                        ),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index)=>buildPostItem(SocialCubit.get(context).posts[index],context,index),
                        separatorBuilder: (context,index)=>SizedBox(height:8.0),
                        itemCount:SocialCubit.get(context).posts.length,

                      ),
                      SizedBox(height: 8.0,),

                      //SizedBox(height: 100,),
                    ],

                  ),
                ),
                fallback: (context) =>Center(child: CircularProgressIndicator()),
              );

            },

          );
        }
    );
  }

  Widget buildPostItem(PostModel model,context,index)=> Card(
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5.0,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(

            children: [

              CircleAvatar(
                radius: 25.0,
                backgroundImage:CachedNetworkImageProvider(
                  '${model.image}',

                ),


              ),
              SizedBox(width: 15.0,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${model.name}',
                          style: TextStyle(
                            height: 1.4,
                          ),

                        ),
                        SizedBox(width: 5.0,),
                        Icon(Icons.check_circle,
                          color:defaultColor,
                          size: 16.0,


                        ),
                      ],
                    ),
                    Text(
                      '${model.dateTime}',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                        height: 1.4,
                      ),

                    )
                  ],
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

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          Text('${model.text}',
            style: Theme.of(context).textTheme.subtitle1,
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 10.0,top: 5),
            child: Container(
              width: double.infinity,
              child: Wrap(
                children: [

                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 6.0),
                    child: Container(
                      height: 25.0,
                      child: MaterialButton(onPressed: (){},
                        minWidth: 1.0,

                        padding: EdgeInsets.zero,
                        child: Text(
                          '#software_developement',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                            color: defaultColor,
                          ),
                        ),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 6.0),
                    child: Container(
                      height: 25.0,
                      child: MaterialButton(onPressed: (){},
                        minWidth: 1.0,

                        padding: EdgeInsets.zero,
                        child: Text(
                          '#flutter',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                            color: defaultColor,
                          ),
                        ),

                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(height: 15.0,),
          if(model.postImage !='')
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 15.0),
              child: Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider('${model.postImage}',
                    ),
                    fit:BoxFit.cover,

                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          Icon(Icons.favorite_border,color: Colors.red,size: 16.0,),
                          SizedBox(width: 5.0,),
                          Text(
                            '${SocialCubit.get(context).likes[index]}',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    onTap: (){

                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.chat,color: Colors.amber,size: 16.0,),
                          SizedBox(width: 5.0,),
                          Text(
                            '0 comment',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    onTap: (){

                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          Row(
            children: [

              Expanded(
                child: InkWell(

                  child: Row(

                    children: [

                      CircleAvatar(
                        radius: 18.0,
                        backgroundImage:CachedNetworkImageProvider(
                          '${SocialCubit.get(context).userModel.image}',

                        ),


                      ),
                      SizedBox(width: 15.0,),
                      Text(
                        'write a comment ...',
                        style: Theme.of(context).textTheme.caption?.copyWith(
                          height: 1.4,
                        ),
                      ),

                    ],
                  ),
                  onTap: (){

                  },
                ),

              ),
              InkWell(
                child: Row(
                  children: [
                    Icon(Icons.favorite_border,color: Colors.red,size: 16.0,),
                    SizedBox(width: 5.0,),
                    Text(
                      'Like',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                onTap: (){
                  SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);

                  setState(() {
                    SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);
                    SocialCubit.get(context).likes[index]=SocialCubit.get(context).likes[index]+1;

                  });


                  //SocialCubit.get(context).likes[index]=SocialCubit.get(context).likes[index]+1;

                  // SocialCubit.get(context).getNumberOfLikes();


                },
              ),
            ],
          )

        ],
      ),
    ),
  );
}













// class FeedsScreen extends StatelessWidget {
//   // const FeedsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//    // SocialCubit.get(context).getStreamPosts();
//
//     return Builder(
//
//         builder: ( BuildContext context) {
//           //SocialCubit.get(context).posts=[];
//           //SocialCubit.get(context).likes=[];
//              // SocialCubit.get(context).postsId=[];
//
//           //SocialCubit.get(context).getStreamPosts();
//
//           return BlocConsumer<SocialCubit , SocialStates >(
//             listener:(context, state) {
//               if(state is SocialCreatePostSuccessstate)
//                 {
//                   SocialCubit.get(context).posts=[];
//                   SocialCubit.get(context).likes=[];
//                   SocialCubit.get(context).postsId=[];
//                   SocialCubit.get(context).getPosts();
//                 }
//               // if(state is SocialLiskePostSuccessState)
//               //   {
//               //
//               //
//               //   }
//
//
//
//             } ,
//             builder: (context, state) {
//
//
//               return       ConditionalBuilder(
//                 condition: SocialCubit.get(context).userModel!=null&&SocialCubit.get(context).posts.length > 0,
//
//                 builder: (context) =>  SingleChildScrollView(
//                   physics: BouncingScrollPhysics(),
//                   child: Column(
//
//                     children: [
//
//                       Card(
//                         clipBehavior: Clip.antiAliasWithSaveLayer,
//                         elevation: 5.0,
//                         margin:EdgeInsets.all(8.0),
//                         child: Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//
//                               CachedNetworkImage(
//                               imageUrl: 'https://img.freepik.com/free-photo/lawn-hand-handshake-smiling-portrait_1134-792.jpg?w=1380&t=st=1678277299~exp=1678277899~hmac=885de599fef0c8ff9642686c5dad29b714cb319f0abbbcb83cc4c893603aef07',
//                                 fit: BoxFit.cover,
//                                 height: 200.0,
//                                 width: double.infinity,
//                               ),
//
//
//
//
//
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 'Communicate with friends',
//                                 style: Theme.of(context).textTheme.subtitle1?.copyWith(
//                                   color: Colors.black,
//                                 ),
//
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       ListView.separated(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemBuilder: (context,index)=>buildPostItem(SocialCubit.get(context).posts[index],context,index),
//                         separatorBuilder: (context,index)=>SizedBox(height:8.0),
//                         itemCount:SocialCubit.get(context).posts.length,
//
//                       ),
//                       SizedBox(height: 8.0,),
//
//                       //SizedBox(height: 100,),
//                     ],
//
//                   ),
//                 ),
//                 fallback: (context) =>Center(child: CircularProgressIndicator()),
//               );
//
//             },
//
//           );
//         }
//     );
//   }
//   Widget buildPostItem(PostModel model,context,index)=> Card(
//     margin: EdgeInsets.symmetric(horizontal: 8.0),
//     clipBehavior: Clip.antiAliasWithSaveLayer,
//     elevation: 5.0,
//     child: Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//
//             children: [
//
//               CircleAvatar(
//                 radius: 25.0,
//                 backgroundImage:CachedNetworkImageProvider(
//                   '${model.image}',
//
//                 ),
//
//
//               ),
//               SizedBox(width: 15.0,),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           '${model.name}',
//                           style: TextStyle(
//                             height: 1.4,
//                           ),
//
//                         ),
//                         SizedBox(width: 5.0,),
//                         Icon(Icons.check_circle,
//                           color:defaultColor,
//                           size: 16.0,
//
//
//                         ),
//                       ],
//                     ),
//                     Text(
//                       '${model.dateTime}',
//                       style: Theme.of(context).textTheme.caption?.copyWith(
//                         height: 1.4,
//                       ),
//
//                     )
//                   ],
//                 ),
//               ),
//
//               SizedBox(width: 15.0,),
//
//               IconButton(onPressed:(){
//
//
//               } , icon: Icon(Icons.more_horiz,
//                 size: 16.0,
//               ),
//               ),
//
//             ],
//           ),
//
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 15.0),
//             child: Container(
//               width: double.infinity,
//               height: 1.0,
//               color: Colors.grey[300],
//             ),
//           ),
//           Text('${model.text}',
//             style: Theme.of(context).textTheme.subtitle1,
//           ),
//
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10.0,top: 5),
//             child: Container(
//               width: double.infinity,
//               child: Wrap(
//                 children: [
//
//                   Padding(
//                     padding: const EdgeInsetsDirectional.only(end: 6.0),
//                     child: Container(
//                       height: 25.0,
//                       child: MaterialButton(onPressed: (){},
//                         minWidth: 1.0,
//
//                         padding: EdgeInsets.zero,
//                         child: Text(
//                           '#software_developement',
//                           style: Theme.of(context).textTheme.caption?.copyWith(
//                             color: defaultColor,
//                           ),
//                         ),
//
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsetsDirectional.only(end: 6.0),
//                     child: Container(
//                       height: 25.0,
//                       child: MaterialButton(onPressed: (){},
//                         minWidth: 1.0,
//
//                         padding: EdgeInsets.zero,
//                         child: Text(
//                           '#flutter',
//                           style: Theme.of(context).textTheme.caption?.copyWith(
//                             color: defaultColor,
//                           ),
//                         ),
//
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // SizedBox(height: 15.0,),
//           if(model.postImage !='')
//             Padding(
//               padding: const EdgeInsetsDirectional.only(top: 15.0),
//               child: Container(
//                 height: 170,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(4.0),
//                   image: DecorationImage(
//                     image: CachedNetworkImageProvider('${model.postImage}',
//                     ),
//                     fit:BoxFit.cover,
//
//                   ),
//                 ),
//               ),
//             ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5.0),
//                       child: Row(
//                         children: [
//                           Icon(Icons.favorite_border,color: Colors.red,size: 16.0,),
//                           SizedBox(width: 5.0,),
//                           Text(
//                             '${SocialCubit.get(context).likes[index]}',
//                             style: Theme.of(context).textTheme.caption,
//                           ),
//                         ],
//                       ),
//                     ),
//                     onTap: (){
//
//                     },
//                   ),
//                 ),
//                 Expanded(
//                   child: InkWell(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Icon(Icons.chat,color: Colors.amber,size: 16.0,),
//                           SizedBox(width: 5.0,),
//                           Text(
//                             '0 comment',
//                             style: Theme.of(context).textTheme.caption,
//                           ),
//                         ],
//                       ),
//                     ),
//                     onTap: (){
//
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10.0),
//             child: Container(
//               width: double.infinity,
//               height: 1.0,
//               color: Colors.grey[300],
//             ),
//           ),
//           Row(
//             children: [
//
//               Expanded(
//                 child: InkWell(
//
//                   child: Row(
//
//                     children: [
//
//                       CircleAvatar(
//                         radius: 18.0,
//                         backgroundImage:CachedNetworkImageProvider(
//                           '${SocialCubit.get(context).userModel.image}',
//
//                         ),
//
//
//                       ),
//                       SizedBox(width: 15.0,),
//                       Text(
//                         'write a comment ...',
//                         style: Theme.of(context).textTheme.caption?.copyWith(
//                           height: 1.4,
//                         ),
//                       ),
//
//                     ],
//                   ),
//                   onTap: (){
//
//                   },
//                 ),
//
//               ),
//               InkWell(
//                 child: Row(
//                   children: [
//                     Icon(Icons.favorite_border,color: Colors.red,size: 16.0,),
//                     SizedBox(width: 5.0,),
//                     Text(
//                       'Like',
//                       style: Theme.of(context).textTheme.caption,
//                     ),
//                   ],
//                 ),
//                 onTap: (){
//                   SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);
//
//                   // setState(() {
//                   //   SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);
//                   //   SocialCubit.get(context).likes[index]=SocialCubit.get(context).likes[index]+1;
//                   //
//                   // });
//
//
//                   //SocialCubit.get(context).likes[index]=SocialCubit.get(context).likes[index]+1;
//
//                   // SocialCubit.get(context).getNumberOfLikes();
//
//
//                 },
//               ),
//             ],
//           )
//
//         ],
//       ),
//     ),
//   );
// }










// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:messenger_design2/layout/social_app/cubit/cubit.dart';
// import 'package:messenger_design2/layout/social_app/cubit/states.dart';
// import 'package:messenger_design2/models/social_app/post_model.dart';
// import 'package:messenger_design2/shared/styles/colors.dart';
//
// class FeedsScreen extends StatefulWidget {
//   @override
//   State<FeedsScreen> createState() => _FeedsScreenState();
// }
//
// class _FeedsScreenState extends State<FeedsScreen> {
//   // const FeedsScreen({Key? key}) : super(key: key);
//   @override
//
//
//   Widget build(BuildContext context) {
//     return BlocConsumer<SocialCubit , SocialStates >(
//       listener:(context, state) {
//         // if(state is SocialCreatePostSuccessstate)
//         // {
//         //   SocialCubit.get(context).posts=[];
//         //   SocialCubit.get(context).likes=[];
//         //   SocialCubit.get(context).postsId=[];
//         //   SocialCubit.get(context).getPosts();
//         // }
//         // if(state is SocialLiskePostSuccessState)
//         //   {
//         //
//         //
//         //   }
//
//
//
//       } ,
//       builder: (context, state) {
//
//         return       ConditionalBuilder(
//           condition: SocialCubit.get(context).userModel!=null&&SocialCubit.get(context).posts.length > 0,
//
//           builder: (context) =>  SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Column(
//
//               children: [
//
//                 Card(
//                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                   elevation: 5.0,
//                   margin:EdgeInsets.all(8.0),
//                   child: Stack(
//                     alignment: AlignmentDirectional.bottomEnd,
//                     children: [
//                       Image(
//                         image: NetworkImage('https://img.freepik.com/free-photo/lawn-hand-handshake-smiling-portrait_1134-792.jpg?w=1380&t=st=1678277299~exp=1678277899~hmac=885de599fef0c8ff9642686c5dad29b714cb319f0abbbcb83cc4c893603aef07',
//
//                         ),
//
//
//                         fit: BoxFit.cover,
//                         height: 200.0,
//                         width: double.infinity,
//
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Communicate with friends',
//                           style: Theme.of(context).textTheme.subtitle1?.copyWith(
//                             color: Colors.black,
//                           ),
//
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 StreamBuilder<QuerySnapshot>(
//                   stream: SocialCubit.get(context).loadPosts(),
//                   builder: (context,snapshot) {
//
//                     return ListView.separated(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemBuilder: (context,index)=>buildPostItem(SocialCubit.get(context).posts[index],context,index),
//                       separatorBuilder: (context,index)=>SizedBox(height:8.0),
//                       itemCount:SocialCubit.get(context).posts.length,
//
//                     );
//                   }
//                 ),
//                 SizedBox(height: 8.0,),
//
//                 //SizedBox(height: 100,),
//               ],
//
//             ),
//           ),
//           fallback: (context) =>Center(child: CircularProgressIndicator()),
//         );
//
//       },
//
//     );
//   }
//
//   Widget buildPostItem(PostModel model,context,index)=> Card(
//     margin: EdgeInsets.symmetric(horizontal: 8.0),
//     clipBehavior: Clip.antiAliasWithSaveLayer,
//     elevation: 5.0,
//     child: Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//
//             children: [
//
//               CircleAvatar(
//                 radius: 25.0,
//                 backgroundImage:NetworkImage(
//                   '${model.image}',
//
//                 ),
//
//
//               ),
//               SizedBox(width: 15.0,),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           '${model.name}',
//                           style: TextStyle(
//                             height: 1.4,
//                           ),
//
//                         ),
//                         SizedBox(width: 5.0,),
//                         Icon(Icons.check_circle,
//                           color:defaultColor,
//                           size: 16.0,
//
//
//                         ),
//                       ],
//                     ),
//                     Text(
//                       '${model.dateTime}',
//                       style: Theme.of(context).textTheme.caption?.copyWith(
//                         height: 1.4,
//                       ),
//
//                     )
//                   ],
//                 ),
//               ),
//
//               SizedBox(width: 15.0,),
//
//               IconButton(onPressed:(){
//
//
//               } , icon: Icon(Icons.more_horiz,
//                 size: 16.0,
//               ),
//               ),
//
//             ],
//           ),
//
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 15.0),
//             child: Container(
//               width: double.infinity,
//               height: 1.0,
//               color: Colors.grey[300],
//             ),
//           ),
//           Text('${model.text}',
//             style: Theme.of(context).textTheme.subtitle1,
//           ),
//
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10.0,top: 5),
//             child: Container(
//               width: double.infinity,
//               child: Wrap(
//                 children: [
//
//                   Padding(
//                     padding: const EdgeInsetsDirectional.only(end: 6.0),
//                     child: Container(
//                       height: 25.0,
//                       child: MaterialButton(onPressed: (){},
//                         minWidth: 1.0,
//
//                         padding: EdgeInsets.zero,
//                         child: Text(
//                           '#software_developement',
//                           style: Theme.of(context).textTheme.caption?.copyWith(
//                             color: defaultColor,
//                           ),
//                         ),
//
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsetsDirectional.only(end: 6.0),
//                     child: Container(
//                       height: 25.0,
//                       child: MaterialButton(onPressed: (){},
//                         minWidth: 1.0,
//
//                         padding: EdgeInsets.zero,
//                         child: Text(
//                           '#flutter',
//                           style: Theme.of(context).textTheme.caption?.copyWith(
//                             color: defaultColor,
//                           ),
//                         ),
//
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // SizedBox(height: 15.0,),
//           if(model.postImage !='')
//             Padding(
//               padding: const EdgeInsetsDirectional.only(top: 15.0),
//               child: Container(
//                 height: 170,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(4.0),
//                   image: DecorationImage(
//                     image: NetworkImage('${model.postImage}',
//                     ),
//                     fit:BoxFit.cover,
//
//                   ),
//                 ),
//               ),
//             ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5.0),
//                       child: Row(
//                         children: [
//                           Icon(Icons.favorite_border,color: Colors.red,size: 16.0,),
//                           SizedBox(width: 5.0,),
//                           Text(
//                             '${SocialCubit.get(context).likes[index]}',
//                             style: Theme.of(context).textTheme.caption,
//                           ),
//                         ],
//                       ),
//                     ),
//                     onTap: (){
//
//                     },
//                   ),
//                 ),
//                 Expanded(
//                   child: InkWell(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Icon(Icons.chat,color: Colors.amber,size: 16.0,),
//                           SizedBox(width: 5.0,),
//                           Text(
//                             '0 comment',
//                             style: Theme.of(context).textTheme.caption,
//                           ),
//                         ],
//                       ),
//                     ),
//                     onTap: (){
//
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10.0),
//             child: Container(
//               width: double.infinity,
//               height: 1.0,
//               color: Colors.grey[300],
//             ),
//           ),
//           Row(
//             children: [
//
//               Expanded(
//                 child: InkWell(
//
//                   child: Row(
//
//                     children: [
//
//                       CircleAvatar(
//                         radius: 18.0,
//                         backgroundImage:NetworkImage(
//                           '${SocialCubit.get(context).userModel.image}',
//
//                         ),
//
//
//                       ),
//                       SizedBox(width: 15.0,),
//                       Text(
//                         'write a comment ...',
//                         style: Theme.of(context).textTheme.caption?.copyWith(
//                           height: 1.4,
//                         ),
//                       ),
//
//                     ],
//                   ),
//                   onTap: (){
//
//                   },
//                 ),
//
//               ),
//               InkWell(
//                 child: Row(
//                   children: [
//                     Icon(Icons.favorite_border,color: Colors.red,size: 16.0,),
//                     SizedBox(width: 5.0,),
//                     Text(
//                       'Like',
//                       style: Theme.of(context).textTheme.caption,
//                     ),
//                   ],
//                 ),
//                 onTap: (){
//                   SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);
//
//                   // setState(() {
//                   //   SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);
//                   //   SocialCubit.get(context).likes[index]=SocialCubit.get(context).likes[index]+1;
//                   //
//                   // });
//
//
//                   //SocialCubit.get(context).likes[index]=SocialCubit.get(context).likes[index]+1;
//
//                   // SocialCubit.get(context).getNumberOfLikes();
//
//
//                 },
//               ),
//             ],
//           )
//
//         ],
//       ),
//     ),
//   );
// }



































// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:messenger_design2/layout/social_app/cubit/cubit.dart';
// import 'package:messenger_design2/layout/social_app/cubit/states.dart';
// import 'package:messenger_design2/models/social_app/post_model.dart';
// import 'package:messenger_design2/shared/styles/colors.dart';
//
// class FeedsScreen extends StatelessWidget {
//  // const FeedsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Builder(
//
//       builder: ( BuildContext context) {
//         // SocialCubit.get(context).posts=[];
//         // SocialCubit.get(context).likes=[];
//         //     SocialCubit.get(context).postsId=[];
//
//         SocialCubit.get(context).getStreamPosts();
//
//         return BlocConsumer<SocialCubit , SocialStates >(
//           listener:(context, state) {
//             // if(state is SocialCreatePostSuccessstate)
//             //   {
//             //     SocialCubit.get(context).posts=[];
//             //     SocialCubit.get(context).likes=[];
//             //     SocialCubit.get(context).postsId=[];
//             //     SocialCubit.get(context).getPosts();
//             //   }
//             // if(state is SocialLiskePostSuccessState)
//             //   {
//             //
//             //
//             //   }
//
//
//
//           } ,
//           builder: (context, state) {
//
//
//             return       ConditionalBuilder(
//               condition: SocialCubit.get(context).userModel!=null&&SocialCubit.get(context).posts.length > 0,
//
//               builder: (context) =>  SingleChildScrollView(
//                 physics: BouncingScrollPhysics(),
//                 child: Column(
//
//                   children: [
//
//                     Card(
//                       clipBehavior: Clip.antiAliasWithSaveLayer,
//                       elevation: 5.0,
//                       margin:EdgeInsets.all(8.0),
//                       child: Stack(
//                         alignment: AlignmentDirectional.bottomEnd,
//                         children: [
//                           Image(
//                             image: NetworkImage('https://img.freepik.com/free-photo/lawn-hand-handshake-smiling-portrait_1134-792.jpg?w=1380&t=st=1678277299~exp=1678277899~hmac=885de599fef0c8ff9642686c5dad29b714cb319f0abbbcb83cc4c893603aef07',
//
//                             ),
//
//
//                             fit: BoxFit.cover,
//                             height: 200.0,
//                             width: double.infinity,
//
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               'Communicate with friends',
//                               style: Theme.of(context).textTheme.subtitle1?.copyWith(
//                                 color: Colors.black,
//                               ),
//
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     ListView.separated(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemBuilder: (context,index)=>buildPostItem(SocialCubit.get(context).posts[index],context,index),
//                       separatorBuilder: (context,index)=>SizedBox(height:8.0),
//                       itemCount:SocialCubit.get(context).posts.length,
//
//                     ),
//                     SizedBox(height: 8.0,),
//
//                     //SizedBox(height: 100,),
//                   ],
//
//                 ),
//               ),
//               fallback: (context) =>Center(child: CircularProgressIndicator()),
//             );
//
//           },
//
//         );
//       }
//     );
//   }
//   Widget buildPostItem(PostModel model,context,index)=> Card(
//     margin: EdgeInsets.symmetric(horizontal: 8.0),
//     clipBehavior: Clip.antiAliasWithSaveLayer,
//     elevation: 5.0,
//     child: Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//
//             children: [
//
//               CircleAvatar(
//                 radius: 25.0,
//                 backgroundImage:NetworkImage(
//                   '${model.image}',
//
//                 ),
//
//
//               ),
//               SizedBox(width: 15.0,),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           '${model.name}',
//                           style: TextStyle(
//                             height: 1.4,
//                           ),
//
//                         ),
//                         SizedBox(width: 5.0,),
//                         Icon(Icons.check_circle,
//                           color:defaultColor,
//                           size: 16.0,
//
//
//                         ),
//                       ],
//                     ),
//                     Text(
//                       '${model.dateTime}',
//                       style: Theme.of(context).textTheme.caption?.copyWith(
//                         height: 1.4,
//                       ),
//
//                     )
//                   ],
//                 ),
//               ),
//
//               SizedBox(width: 15.0,),
//
//               IconButton(onPressed:(){
//
//
//               } , icon: Icon(Icons.more_horiz,
//                 size: 16.0,
//               ),
//               ),
//
//             ],
//           ),
//
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 15.0),
//             child: Container(
//               width: double.infinity,
//               height: 1.0,
//               color: Colors.grey[300],
//             ),
//           ),
//           Text('${model.text}',
//             style: Theme.of(context).textTheme.subtitle1,
//           ),
//
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10.0,top: 5),
//             child: Container(
//               width: double.infinity,
//               child: Wrap(
//                 children: [
//
//                   Padding(
//                     padding: const EdgeInsetsDirectional.only(end: 6.0),
//                     child: Container(
//                       height: 25.0,
//                       child: MaterialButton(onPressed: (){},
//                         minWidth: 1.0,
//
//                         padding: EdgeInsets.zero,
//                         child: Text(
//                           '#software_developement',
//                           style: Theme.of(context).textTheme.caption?.copyWith(
//                             color: defaultColor,
//                           ),
//                         ),
//
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsetsDirectional.only(end: 6.0),
//                     child: Container(
//                       height: 25.0,
//                       child: MaterialButton(onPressed: (){},
//                         minWidth: 1.0,
//
//                         padding: EdgeInsets.zero,
//                         child: Text(
//                           '#flutter',
//                           style: Theme.of(context).textTheme.caption?.copyWith(
//                             color: defaultColor,
//                           ),
//                         ),
//
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//          // SizedBox(height: 15.0,),
//           if(model.postImage !='')
//           Padding(
//             padding: const EdgeInsetsDirectional.only(top: 15.0),
//             child: Container(
//               height: 170,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(4.0),
//                 image: DecorationImage(
//                   image: NetworkImage('${model.postImage}',
//                   ),
//                   fit:BoxFit.cover,
//
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5.0),
//                       child: Row(
//                         children: [
//                           Icon(Icons.favorite_border,color: Colors.red,size: 16.0,),
//                           SizedBox(width: 5.0,),
//                           Text(
//                             '${SocialCubit.get(context).likes[index]}',
//                             style: Theme.of(context).textTheme.caption,
//                           ),
//                         ],
//                       ),
//                     ),
//                     onTap: (){
//
//                     },
//                   ),
//                 ),
//                 Expanded(
//                   child: InkWell(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Icon(Icons.chat,color: Colors.amber,size: 16.0,),
//                           SizedBox(width: 5.0,),
//                           Text(
//                             '0 comment',
//                             style: Theme.of(context).textTheme.caption,
//                           ),
//                         ],
//                       ),
//                     ),
//                     onTap: (){
//
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10.0),
//             child: Container(
//               width: double.infinity,
//               height: 1.0,
//               color: Colors.grey[300],
//             ),
//           ),
//           Row(
//             children: [
//
//               Expanded(
//                 child: InkWell(
//
//                   child: Row(
//
//                     children: [
//
//                       CircleAvatar(
//                         radius: 18.0,
//                         backgroundImage:NetworkImage(
//                           '${SocialCubit.get(context).userModel.image}',
//
//                         ),
//
//
//                       ),
//                       SizedBox(width: 15.0,),
//                       Text(
//                         'write a comment ...',
//                         style: Theme.of(context).textTheme.caption?.copyWith(
//                           height: 1.4,
//                         ),
//                       ),
//
//                     ],
//                   ),
//                   onTap: (){
//
//                   },
//                 ),
//
//               ),
//               InkWell(
//                 child: Row(
//                   children: [
//                     Icon(Icons.favorite_border,color: Colors.red,size: 16.0,),
//                     SizedBox(width: 5.0,),
//                     Text(
//                       'Like',
//                       style: Theme.of(context).textTheme.caption,
//                     ),
//                   ],
//                 ),
//                 onTap: (){
//                   SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);
//
//                   // setState(() {
//                   //   SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);
//                   //   SocialCubit.get(context).likes[index]=SocialCubit.get(context).likes[index]+1;
//                   //
//                   // });
//
//
//                   //SocialCubit.get(context).likes[index]=SocialCubit.get(context).likes[index]+1;
//
//                  // SocialCubit.get(context).getNumberOfLikes();
//
//
//                 },
//               ),
//             ],
//           )
//
//         ],
//       ),
//     ),
//   );
// }










// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:messenger_design2/layout/social_app/cubit/cubit.dart';
// import 'package:messenger_design2/layout/social_app/cubit/states.dart';
// import 'package:messenger_design2/models/social_app/post_model.dart';
// import 'package:messenger_design2/shared/styles/colors.dart';
//
// class FeedsScreen extends StatefulWidget {
//   @override
//   State<FeedsScreen> createState() => _FeedsScreenState();
// }
//
// class _FeedsScreenState extends State<FeedsScreen> {
//   // const FeedsScreen({Key? key}) : super(key: key);
//   @override
//
//
//   Widget build(BuildContext context) {
//     return BlocConsumer<SocialCubit , SocialStates >(
//       listener:(context, state) {
//         // if(state is SocialCreatePostSuccessstate)
//         // {
//         //   SocialCubit.get(context).posts=[];
//         //   SocialCubit.get(context).likes=[];
//         //   SocialCubit.get(context).postsId=[];
//         //   SocialCubit.get(context).getPosts();
//         // }
//         // if(state is SocialLiskePostSuccessState)
//         //   {
//         //
//         //
//         //   }
//
//
//
//       } ,
//       builder: (context, state) {
//
//         return       ConditionalBuilder(
//           condition: SocialCubit.get(context).userModel!=null&&SocialCubit.get(context).posts.length > 0,
//
//           builder: (context) =>  SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Column(
//
//               children: [
//
//                 Card(
//                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                   elevation: 5.0,
//                   margin:EdgeInsets.all(8.0),
//                   child: Stack(
//                     alignment: AlignmentDirectional.bottomEnd,
//                     children: [
//                       Image(
//                         image: NetworkImage('https://img.freepik.com/free-photo/lawn-hand-handshake-smiling-portrait_1134-792.jpg?w=1380&t=st=1678277299~exp=1678277899~hmac=885de599fef0c8ff9642686c5dad29b714cb319f0abbbcb83cc4c893603aef07',
//
//                         ),
//
//
//                         fit: BoxFit.cover,
//                         height: 200.0,
//                         width: double.infinity,
//
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Communicate with friends',
//                           style: Theme.of(context).textTheme.subtitle1?.copyWith(
//                             color: Colors.black,
//                           ),
//
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 StreamBuilder<QuerySnapshot>(
//                   stream: SocialCubit.get(context).loadPosts(),
//                   builder: (context,snapshot) {
//
//                     return ListView.separated(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemBuilder: (context,index)=>buildPostItem(SocialCubit.get(context).posts[index],context,index),
//                       separatorBuilder: (context,index)=>SizedBox(height:8.0),
//                       itemCount:SocialCubit.get(context).posts.length,
//
//                     );
//                   }
//                 ),
//                 SizedBox(height: 8.0,),
//
//                 //SizedBox(height: 100,),
//               ],
//
//             ),
//           ),
//           fallback: (context) =>Center(child: CircularProgressIndicator()),
//         );
//
//       },
//
//     );
//   }
//
//   Widget buildPostItem(PostModel model,context,index)=> Card(
//     margin: EdgeInsets.symmetric(horizontal: 8.0),
//     clipBehavior: Clip.antiAliasWithSaveLayer,
//     elevation: 5.0,
//     child: Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//
//             children: [
//
//               CircleAvatar(
//                 radius: 25.0,
//                 backgroundImage:NetworkImage(
//                   '${model.image}',
//
//                 ),
//
//
//               ),
//               SizedBox(width: 15.0,),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           '${model.name}',
//                           style: TextStyle(
//                             height: 1.4,
//                           ),
//
//                         ),
//                         SizedBox(width: 5.0,),
//                         Icon(Icons.check_circle,
//                           color:defaultColor,
//                           size: 16.0,
//
//
//                         ),
//                       ],
//                     ),
//                     Text(
//                       '${model.dateTime}',
//                       style: Theme.of(context).textTheme.caption?.copyWith(
//                         height: 1.4,
//                       ),
//
//                     )
//                   ],
//                 ),
//               ),
//
//               SizedBox(width: 15.0,),
//
//               IconButton(onPressed:(){
//
//
//               } , icon: Icon(Icons.more_horiz,
//                 size: 16.0,
//               ),
//               ),
//
//             ],
//           ),
//
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 15.0),
//             child: Container(
//               width: double.infinity,
//               height: 1.0,
//               color: Colors.grey[300],
//             ),
//           ),
//           Text('${model.text}',
//             style: Theme.of(context).textTheme.subtitle1,
//           ),
//
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10.0,top: 5),
//             child: Container(
//               width: double.infinity,
//               child: Wrap(
//                 children: [
//
//                   Padding(
//                     padding: const EdgeInsetsDirectional.only(end: 6.0),
//                     child: Container(
//                       height: 25.0,
//                       child: MaterialButton(onPressed: (){},
//                         minWidth: 1.0,
//
//                         padding: EdgeInsets.zero,
//                         child: Text(
//                           '#software_developement',
//                           style: Theme.of(context).textTheme.caption?.copyWith(
//                             color: defaultColor,
//                           ),
//                         ),
//
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsetsDirectional.only(end: 6.0),
//                     child: Container(
//                       height: 25.0,
//                       child: MaterialButton(onPressed: (){},
//                         minWidth: 1.0,
//
//                         padding: EdgeInsets.zero,
//                         child: Text(
//                           '#flutter',
//                           style: Theme.of(context).textTheme.caption?.copyWith(
//                             color: defaultColor,
//                           ),
//                         ),
//
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // SizedBox(height: 15.0,),
//           if(model.postImage !='')
//             Padding(
//               padding: const EdgeInsetsDirectional.only(top: 15.0),
//               child: Container(
//                 height: 170,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(4.0),
//                   image: DecorationImage(
//                     image: NetworkImage('${model.postImage}',
//                     ),
//                     fit:BoxFit.cover,
//
//                   ),
//                 ),
//               ),
//             ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5.0),
//                       child: Row(
//                         children: [
//                           Icon(Icons.favorite_border,color: Colors.red,size: 16.0,),
//                           SizedBox(width: 5.0,),
//                           Text(
//                             '${SocialCubit.get(context).likes[index]}',
//                             style: Theme.of(context).textTheme.caption,
//                           ),
//                         ],
//                       ),
//                     ),
//                     onTap: (){
//
//                     },
//                   ),
//                 ),
//                 Expanded(
//                   child: InkWell(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Icon(Icons.chat,color: Colors.amber,size: 16.0,),
//                           SizedBox(width: 5.0,),
//                           Text(
//                             '0 comment',
//                             style: Theme.of(context).textTheme.caption,
//                           ),
//                         ],
//                       ),
//                     ),
//                     onTap: (){
//
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10.0),
//             child: Container(
//               width: double.infinity,
//               height: 1.0,
//               color: Colors.grey[300],
//             ),
//           ),
//           Row(
//             children: [
//
//               Expanded(
//                 child: InkWell(
//
//                   child: Row(
//
//                     children: [
//
//                       CircleAvatar(
//                         radius: 18.0,
//                         backgroundImage:NetworkImage(
//                           '${SocialCubit.get(context).userModel.image}',
//
//                         ),
//
//
//                       ),
//                       SizedBox(width: 15.0,),
//                       Text(
//                         'write a comment ...',
//                         style: Theme.of(context).textTheme.caption?.copyWith(
//                           height: 1.4,
//                         ),
//                       ),
//
//                     ],
//                   ),
//                   onTap: (){
//
//                   },
//                 ),
//
//               ),
//               InkWell(
//                 child: Row(
//                   children: [
//                     Icon(Icons.favorite_border,color: Colors.red,size: 16.0,),
//                     SizedBox(width: 5.0,),
//                     Text(
//                       'Like',
//                       style: Theme.of(context).textTheme.caption,
//                     ),
//                   ],
//                 ),
//                 onTap: (){
//                   SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);
//
//                   // setState(() {
//                   //   SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);
//                   //   SocialCubit.get(context).likes[index]=SocialCubit.get(context).likes[index]+1;
//                   //
//                   // });
//
//
//                   //SocialCubit.get(context).likes[index]=SocialCubit.get(context).likes[index]+1;
//
//                   // SocialCubit.get(context).getNumberOfLikes();
//
//
//                 },
//               ),
//             ],
//           )
//
//         ],
//       ),
//     ),
//   );
// }














