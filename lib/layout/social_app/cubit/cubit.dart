import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:messenger_design2/layout/social_app/cubit/states.dart';
import 'package:messenger_design2/models/social_app/message_model.dart';
import 'package:messenger_design2/models/social_app/post_model.dart';
import 'package:messenger_design2/models/social_app/social_user_model.dart';
import 'package:messenger_design2/modules/social_app/chats/chats_screen.dart';
import 'package:messenger_design2/modules/social_app/feeds/feeds_screen.dart';
import 'package:messenger_design2/modules/social_app/new_post/new_post_screen.dart';
import 'package:messenger_design2/modules/social_app/settings/settings_screen.dart';
import 'package:messenger_design2/modules/social_app/users/users_screen.dart';
import 'package:messenger_design2/shared/components/constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocialCubit extends Cubit<SocialStates>{

  SocialCubit(): super(SocialInitialState());
 static SocialCubit get(context)=> BlocProvider.of(context);

  late SocialUserModel userModel=SocialUserModel();






  void getUserData()
  {
    emit(SocialGetUserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value){
      print(value.data());
      //userModel=SocialUserModel.fromjson(value);
      userModel=SocialUserModel.fromjson(value.data()!);

      emit(SocialGetUserSuccessState());
    }).catchError((error){
      print(error.toString());

      emit(SocialGetUserErrorState(error.toString()));

    });


  }

  int currentindex=0;
  List<Widget> screens=[
    FeedsScreen(),
    ChatsScreen(),
    NewPostScreen(),
    UsersScreen(),
    SettingsScreen(),



  ];
  List<String> titles=[
    'Home',
    'Chats',
    'Post',
    'Users',
    'Settings',
  ];

  void ChangeBottomNav(int index)
  {
      if(index==1)
        {
          if(users.length==0)
            {
              getUsers();

            }

        }

      if(index==2)
        {
          emit(SocialNewPoststate());
        }
      else{
        currentindex=index;

        emit(SocialChangeBottomNavstate());

      }



  }

    File? ProfileImage;
  var picker=ImagePicker();
  Future<void> getProfileImage() async{
    final pickedFile=await picker.getImage(source: ImageSource.gallery);
    if(pickedFile!=null)
    {
      ProfileImage=File(pickedFile.path);
      emit(SocialProfileImagePickedSuccessstate());
    }
    else{
      print('No image selected');
      emit(SocialProfileImagePickedErrorstate());
    }



  }


  File? ProfilefromCameraImage;
  //var picker=ImagePicker();
  Future<void> getProfilefromCameraImage() async{
    final pickedFile=await picker.getImage(source: ImageSource.camera);
    if(pickedFile!=null)
    {
      ProfilefromCameraImage=File(pickedFile.path);
      emit(SocialProfileFromCameraImagePickedSuccessstate());
    }
    else{
      print('No image selected');
      emit(SocialProfileFromCameraImagePickedErrorstate());
    }



  }



  File? CoverImage;
  Future<void> getCoverImage() async{
    final pickedFile=await picker.getImage(source: ImageSource.gallery);
    if(pickedFile!=null)
    {
      CoverImage=File(pickedFile.path);
      emit(SocialCoverImagePickedSuccessstate());
    }
    else{
      print('No image selected');
      emit(SocialCoverImagePickedErrorstate());
    }



  }


  //String profileImageUrl='';
 // String coverImageUrl='';


  Future<void> uploadProfileImage({

    required String name,
    required String phone,
    required String bio,
})
 async {
    emit(SocialUserUpdateLoadingstate());
   await firebase_storage.FirebaseStorage
        .instance
        .ref()
        .child('users/${Uri.file(ProfileImage!.path).pathSegments.last}')
        .putFile(ProfileImage!).then((value) {
          value.ref.getDownloadURL().then((value) {
           // emit(SocialUploadProfileImageSuccessstate());
           // print(value);
           updateUser(name: name, phone: phone, bio: bio,image: value,cover: null);

          }).catchError((error) {
           // print(error.toString());
            emit(SocialUploadProfileImageErrorstate());


          });

    }).catchError((error) {
      emit(SocialUploadProfileImageErrorstate());


    });

  }

 Future<void> uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
})

  async{
    emit(SocialUserUpdateLoadingstate());

    await firebase_storage.FirebaseStorage
        .instance
        .ref()
        .child('users/${Uri.file(CoverImage!.path).pathSegments.last}')
        .putFile(CoverImage!).then((value) {
      value.ref.getDownloadURL().then((value) {
       // emit(SocialUploadCoverImageSuccessstate());
       // print(value);
        updateUser(name: name, phone: phone, bio: bio,image: null,cover: value);


      })
          .catchError((error) {
        emit(SocialUploadCoverImageErrorstate());


      });

    })
        .catchError((error) {
      emit(SocialUploadCoverImageErrorstate());


    });

  }


  // void updateUserImages({
  //
  // required String name,
  //   required String phone,
  //   required String bio,
  //
  //
  //
  // })
  // {
  //   emit(SocialUserUpdateLoadingstate());
  //
  //   if(CoverImage!=null)
  //     {
  //       uploadCoverImage();
  //
  //     }
  //   else if(ProfileImage!=null)
  //     {
  //
  //     }
  //   else if (ProfileImage!=null&&CoverImage!=null)
  //     {
  //
  //     }
  //   else{
  //     updateUser(name: name, phone: phone, bio: bio);
  //
  //
  //   }
  //
  //
  //
  //
  //
  // }

  void updateUser({
    required String name,
    required String phone,
    required String bio,
    String? cover,
    String? image,
})
  {
    SocialUserModel model=SocialUserModel(
      name:name,
      email: userModel.email,
      image: image?? userModel.image,
      cover:cover?? userModel.cover,
      uId: userModel.uId,
      phone: phone,
      //cover:coverImageUrl ,
      bio:bio,
      //image: profileImageUrl,
    );

    FirebaseFirestore.instance.collection('users').doc(userModel.uId).update(model.toMap()).then((value) {
      getUserData();

    }).catchError((error) {
      emit(SocialUserUpdateErrorstate());

    });

  }

  void removePostImage()
  {
    PostImage=null;
    emit(SocialRemovePostImagestate());
  }



  File? PostImage;
  Future<void> getPostImage() async{
    final pickedFile=await picker.getImage(source: ImageSource.gallery);
    if(pickedFile!=null)
    {
      PostImage=File(pickedFile.path);
      emit(SocialPostImagePickedSuccessstate());
    }
    else{
      print('No image selected');
      emit(SocialPostImagePickedErrorstate());
    }



  }


  Future<void> uploadPostImage({
    required String dateTime,
    required String text,
  })

  async{
    emit(SocialCreatePostLoadingstate());

    await firebase_storage.FirebaseStorage
        .instance
        .ref()
        .child('posts/${Uri.file(PostImage!.path).pathSegments.last}')
        .putFile(PostImage!).then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(SocialUploadCoverImageSuccessstate());
        // print(value);
        createPost(dateTime: dateTime, text: text,postImage: value);


      })
          .catchError((error) {
        emit(SocialCreatePostErrorstate());


      });

    })
        .catchError((error) {
      emit(SocialCreatePostErrorstate());


    });

  }

  Future<void> createPost({
    required String dateTime,
    required String text,
    String? postImage,
  })async
  {
    emit(SocialCreatePostLoadingstate());
    PostModel model=PostModel(
      name:userModel.name,
      image:userModel.image,
      uId: userModel.uId,
      dateTime: dateTime,
      text: text,
      postImage: postImage??'',
      //cover:coverImageUrl ,
      //image: profileImageUrl,
    );

   await FirebaseFirestore.instance
        .collection('posts')

        .add(model.toMap()).then((value) {
      emit(SocialCreatePostSuccessstate());
      posts=[];
      postsId=[];
      likes=[];
     // emit(SocialGetPostsLoadingState());
     // getPosts();

    }).catchError((error) {
      emit(SocialCreatePostErrorstate());

    });

  }

  List<PostModel> posts= [];
  List<String> postsId= [];
  List<int> likes= [];



  Future<void> getNumberOfLikes()async
  {
  //  emit(SocialGetPostsLoadingState());

  await   FirebaseFirestore.instance.collection('posts')
        .get().then((value) {
          value.docs.forEach((element) {

            element.reference.collection('likes')
                .get().then((value) {
                  likes.add(value.docs.length);
                  print(value.docs.length);
                  emit(SocialLiskePostNumberSuccessState());

            }).catchError((error) {
              emit(SocialLiskePostNumberErrorState(error));
            });
          });

    }).catchError((error) {

    });

  }

 Future<void>  getPosts() async
  {
    emit(SocialGetPostsLoadingState());

  await FirebaseFirestore.instance
        .collection('posts')
        .get().then((value) {
          value.docs.forEach((element) {
            element.reference
            .collection('likes')
            .get()
            .then((value) {
              likes.add(value.docs.length);
              postsId.add(element.id);
              posts.add(PostModel.fromjson(element.data()));

            }).catchError((error) {

            });


          });

          emit(SocialGetPostsSuccessState());
    }).catchError((error) {
          emit(SocialGetPostsErrorState(error.toString()));
    });


  }



  void getStreamPosts()
  {
    FirebaseFirestore.instance
        .collection('posts').orderBy('dateTime')
        .snapshots().listen((event) {
      posts=[];
      postsId=[];
      likes=[];
      event.docs.forEach((element) {
        element.reference
            .collection('likes')
            .snapshots().
        listen((event) {
          likes.add(event.docs.length);
          postsId.add(element.id);
          posts.add(PostModel.fromjson(element.data()));


        });
       // likes=[];
       // posts=[];
        //postsId=[];



      });



    });

  }



  // Stream<QuerySnapshot> loadPosts(){
  //   return FirebaseFirestore.instance.collection('posts').snapshots();
  //
  //
  // }

  // void feedsStreamProvide()
  // {
  //
  //
  // }



  Future<void> likePost(String postId)async
  {
    // if(FirebaseFirestore.instance.collection('posts')
    // .doc(postId).collection('likes')
    // .doc(userModel.uId)
    // .get()==true
    // )
    //   {
    //     FirebaseFirestore.instance
    //         .collection('posts')
    //         .doc(postId)
    //         .collection('likes')
    //         .doc(userModel.uId)
    //         .update({
    //       'like':FieldValue.delete(),
    //     }).then((value) {
    //       emit(SocialLiskePostSuccessState());
    //       // posts=[];
    //       // postsId=[];
    //       // likes=[];
    //       // getPosts();
    //     }).catchError((error) {
    //       emit(SocialLiskePostErrorState(error.toString()));
    //     });
    //
    //   }

   await FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userModel.uId)
        .set({
      'like':true,
    }).then((value) {
      emit(SocialLiskePostSuccessState());
      // posts=[];
      // postsId=[];
      // likes=[];
      // getPosts();
    }).catchError((error) {
          emit(SocialLiskePostErrorState(error.toString()));
    });

  }

  List<SocialUserModel> users=[];

  void getUsers()
  {
    users=[];
    emit(SocialGetAllUsersLoadingState());
    FirebaseFirestore.instance
        .collection('users').get().then((value) {
          value.docs.forEach((element) {
            if(element.data()['uId']!=userModel.uId)
            users.add(SocialUserModel.fromjson(element.data()));
            emit(SocialGetAllUsersSuccessState());
            
          });

    }).catchError((error) {
      print(error.toString());
      emit(SocialGetAllUsersErrorState(error.toString()));
    });




  }

  void sendMessage({

 required String receiverId,
    required String dateTime,
    required String text,


  })
  {

    MessageModel model=MessageModel(

      text: text,
      senderId: userModel.uId,
      receiverId: receiverId,
      dateTime: dateTime,
    );

    // Set my chats

    FirebaseFirestore.instance.collection('users')
    .doc(userModel.uId)
    .collection('chats')
    .doc(receiverId)
    .collection('messages')
    .add(model.toMap()).then((value) {
      emit(SocialSendMessageSuccessState());


    }).catchError((error){

      emit(SocialSendMessageErrorState());

    });

    // Set receiver chats

    FirebaseFirestore.instance.collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(userModel.uId)
        .collection('messages')
        .add(model.toMap()).then((value) {
      emit(SocialSendMessageSuccessState());


    }).catchError((error){

      emit(SocialSendMessageErrorState());

    });


  }


  List<MessageModel> messages=[];

  void getMessages({
  required String receiverId,
})
{

  FirebaseFirestore.instance
      .collection('users')
      .doc(userModel.uId)
      .collection('chats')
      .doc(receiverId)
      .collection('messages')
      .orderBy('dateTime')
      .snapshots()
      .listen((event) {

       messages=[];
    event.docs.forEach((element) {
          messages.add(MessageModel.fromjson(element.data()));



        });
        emit(SocialGetMessagesSuccessState());


  });

}




}