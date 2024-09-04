//import 'dart:io';

//import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:messenger_design2/layout/social_app/cubit/cubit.dart';
import 'package:messenger_design2/layout/social_app/cubit/states.dart';
import 'package:messenger_design2/shared/components/components.dart';

class EditProfileScreen extends StatelessWidget {
  //const NewPost({Key? key}) : super(key: key);
  var nameController =TextEditingController();
  var bioController =TextEditingController();
  var phoneController =TextEditingController();





  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
        listener: (context,state){},
        builder: (context,state){
          var userModel=SocialCubit.get(context).userModel;
          nameController.text=userModel.name;
          bioController.text=userModel.bio;
          phoneController.text=userModel.phone;



          //var profileImage = SocialCubit.get(context).CoverImage;
          //var coverImage = SocialCubit.get(context).ProfileImage;
          //var profilefromCameraImage=SocialCubit.get(context).ProfilefromCameraImage;

          return     Scaffold(

            appBar: defaultAppBar(
                context:context,
                title: 'Edit Profile',
                actions: [
                  defaultTextbutton(function: (){
                    SocialCubit.get(context).updateUser(
                        name: nameController.text, phone: phoneController.text, bio: bioController.text
                    );

                  }, text: 'Update',),
                  SizedBox(width: 15.0,)

                ]


            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(

                  children: [
                    if(state is SocialUserUpdateLoadingstate)

                    LinearProgressIndicator(

                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      height: 210.0,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Align(
                            child: Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                Container(
                                  height: 170,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),

                                    ),
                                    image: DecorationImage(
                                      image:
                                          SocialCubit.get(context).CoverImage==null ?
                                      //state is !SocialCoverImagePickedSuccessstate ?
                                      CachedNetworkImageProvider(
                                        '${userModel.cover}',
                                      ) : Image.file(SocialCubit.get(context).CoverImage!).image,
                                      fit:BoxFit.cover,

                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: ()
                                    {
                                      SocialCubit.get(context).getCoverImage();
                                    },
                                    icon: CircleAvatar(
                                      radius: 20.0,
                                        child: Icon(Icons.camera_alt_outlined,
                                        size: 20.0,),
                                    ),
                                ),
                              ],
                            ),
                            alignment: AlignmentDirectional.topCenter,
                          ),
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,

                            children: [
                              CircleAvatar(
                                radius: 64.0,
                                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                child: CircleAvatar(
                                  radius: 60.0,
                                  backgroundImage:
                                  SocialCubit.get(context).ProfileImage==null
                                  //state is !SocialProfileImagePickedSuccessstate
                                 // state is !SocialProfileFromCameraImagePickedSuccessstate
                                      ?  CachedNetworkImageProvider(
                                    '${userModel.image}',

                                  ) :Image.file(SocialCubit.get(context).ProfileImage!).image
                                  //FileImage(profilefromCameraImage!) as ImageProvider ,




                                ),
                              ),
                              IconButton(
                                onPressed: ()
                              {
                                SocialCubit.get(context).getProfileImage();
                               // SocialCubit.get(context).getProfilefromCameraImage();
                              },
                                icon: CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(Icons.camera_alt_outlined,
                                    size: 20.0,),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    if(SocialCubit.get(context).ProfileImage!=null||SocialCubit.get(context).CoverImage!=null)
                    Row(
                      children: [
                        if(SocialCubit.get(context).ProfileImage!=null)
                        Expanded(
                            child: Column(
                              children: [
                                defaultButton(function: ()
                                {
                                  SocialCubit.get(context).uploadProfileImage(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      bio: bioController.text,
                                  );
                                }
                                , text: 'Upload Profile',),
                                if(state is SocialUserUpdateLoadingstate)

                                  SizedBox(height: 5.0,),
                                if(state is SocialUserUpdateLoadingstate)

                                  LinearProgressIndicator(

                                ),
                              ],
                            ),

                        ),
                          SizedBox(width: 5.0,),
                        if(SocialCubit.get(context).CoverImage!=null)
                          Expanded(
                            child: Column(
                              children: [
                                defaultButton(function: ()
                                {
                                  SocialCubit.get(context).uploadCoverImage(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    bio: bioController.text,
                                  );
                                },
                                  text: 'Upload Cover',),
                                if(state is SocialUserUpdateLoadingstate)

                                  SizedBox(height: 5.0,),
                                if(state is SocialUserUpdateLoadingstate)

                                  LinearProgressIndicator(

                                ),
                              ],
                            ),),






                      ],
                    ),
                    if(SocialCubit.get(context).ProfileImage!=null||SocialCubit.get(context).CoverImage!=null)

                      SizedBox(height: 20.0,),




                    defaultFormField(
                        prefix:Icons.person,
                        type: TextInputType.name,
                        controller: nameController,
                        validate:( value){
                          if(value!.isEmpty)
                            {
                              return 'Name must not be empty';
                            }
                          return null;

                        },
                        label:'Name',
                    ),
                    SizedBox(height: 10.0,),
                    defaultFormField(
                      prefix:Icons.info_outline,
                      type: TextInputType.text,
                      controller: bioController,
                      validate:( value){
                        if(value!.isEmpty)
                        {
                          return 'Bio must not be empty';
                        }
                        return null;

                      },
                      label:'Bio',
                    ),
                    SizedBox(height: 10.0,),
                    defaultFormField(
                      prefix:Icons.call,
                      type: TextInputType.phone,
                      controller: phoneController,
                      validate:( value){
                        if(value!.isEmpty)
                        {
                          return 'Phone number must not be empty';
                        }
                        return null;

                      },
                      label:'Phone',
                    ),

                  ],
                ),
              ),
            ),
          );
        },

    );

  }
}
