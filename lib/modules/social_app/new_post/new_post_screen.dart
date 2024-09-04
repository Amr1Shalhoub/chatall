import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/layout/social_app/cubit/cubit.dart';
import 'package:messenger_design2/layout/social_app/cubit/states.dart';
import 'package:messenger_design2/shared/components/components.dart';
//import 'package:messenger_design2/shared/styles/colors.dart';

//import '../../../shared/styles/colors.dart';

class NewPostScreen extends StatelessWidget {

  var textController=TextEditingController();
  //const NewPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: ( context, state) {},
      builder:  ( context, state) {

        return Scaffold(

          appBar: defaultAppBar(
            context:context,
            title: 'Create Post',
            actions: [

              defaultTextbutton(
                  function: (){
                    var now=DateTime.now();

                    if(SocialCubit.get(context).PostImage == null)
                      {
                        SocialCubit.get(context).createPost(dateTime:now.toString(), text: textController.text);
                      }
                    else{
                      SocialCubit.get(context).uploadPostImage( dateTime: now.toString(), text: textController.text);
                    }
                  },
                  text: 'Post'
              ),
            ],




          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if(state is SocialCreatePostLoadingstate)
                LinearProgressIndicator(),
                if(state is SocialCreatePostLoadingstate)
                  SizedBox(height: 10,),


                Row(
                  children: [

                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage:CachedNetworkImageProvider(
                        '${SocialCubit.get(context).userModel.image}',
                       // 'https://img.freepik.com/free-photo/portrait-smiling-businesswoman-office_329181-8852.jpg?w=1060&t=st=1678279314~exp=1678279914~hmac=b0a5130663d0ca14c87f32ddda84933c4279026554592b3f278667153a44a44a',

                      ),


                    ),
                    SizedBox(width: 15.0,),
                    Expanded(
                      child:  Text(
                        '${SocialCubit.get(context).userModel.name}',
                        style: TextStyle(
                          height: 1.4,
                        ),

                      ),
                    ),
                  ],
                ),

                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'What is on your mind...',
                      border: InputBorder.none,
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                if(SocialCubit.get(context).PostImage!=null)

                    Expanded(
                      child: Container(
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          image: DecorationImage(
                            image:Image.file(SocialCubit.get(context).PostImage!).image,
                          fit: BoxFit.cover,

                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: ()
                      {
                       SocialCubit.get(context).removePostImage();
                      },
                      icon: CircleAvatar(
                        radius: 20.0,
                        child: Icon(Icons.close,
                          size: 20.0,),
                      ),
                    ),

                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: (){

                            SocialCubit.get(context).getPostImage();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image),
                              SizedBox(width: 5.0,),
                              Text('Add photo',),
                            ],
                          )
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: (){},
                          child:  Text('# tags',),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },


    );
  }
}
