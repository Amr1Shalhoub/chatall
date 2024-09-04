import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/layout/social_app/cubit/cubit.dart';
import 'package:messenger_design2/layout/social_app/cubit/states.dart';
import 'package:messenger_design2/models/social_app/social_user_model.dart';
import 'package:messenger_design2/modules/social_app/edit_profile/edit_profile_screen.dart';
import 'package:messenger_design2/shared/components/components.dart';

class SettingsScreen extends StatelessWidget {
 // const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context , state) {},
      builder:  (context , state) {
        var userModel=SocialCubit.get(context).userModel;
        //userModel=SocialUserModel.fromjson(Map<String,dynamic> );

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            children: [

              Container(
                height: 210.0,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      child: Container(
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),

                          ),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              '${userModel.cover}',
                            ),
                            fit:BoxFit.cover,

                          ),
                        ),
                      ),
                      alignment: AlignmentDirectional.topCenter,
                    ),
                    CircleAvatar(
                      radius: 64.0,
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage:CachedNetworkImageProvider(
                          '${userModel.image}',

                        ),


                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0,),
              Text(
                '${userModel.name}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                '${userModel.bio}',
                style: Theme.of(context).textTheme.caption,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '100',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Text(
                              'Posts',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        onTap: ()
                        {

                        },
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '264',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Text(
                              'Photos',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        onTap: ()
                        {

                        },
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '10k',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Text(
                              'Followers',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        onTap: ()
                        {

                        },
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '34',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Text(
                              'Followings',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        onTap: ()
                        {

                        },
                      ),
                    ),



                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: (){}, child: Text('Add Photos'),
                      ),


                  ),
                  SizedBox(width: 10.0,),
                  OutlinedButton(
                    onPressed: (){
                      navigateTo(context, EditProfileScreen());
                    }, child: Icon(
                    Icons.edit,
                    size: 16,
                  ),
                  ),
                ],
              )


            ],
          ),
        );
      },

    );
  }
}
