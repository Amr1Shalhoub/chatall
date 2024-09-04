abstract class SocialStates{}

class SocialInitialState extends SocialStates{}
class SocialGetUserSuccessState extends SocialStates{}
class SocialGetUserLoadingState extends SocialStates{}

class SocialGetUserErrorState extends SocialStates{

  final String error;
  SocialGetUserErrorState(this.error);

}

class SocialSendMessageSuccessState extends SocialStates{}
class SocialSendMessageErrorState extends SocialStates{}


class SocialGetMessagesSuccessState extends SocialStates{}
class SocialGetMessagesErrorState extends SocialStates{}





class SocialGetAllUsersSuccessState extends SocialStates{}
class SocialGetAllUsersLoadingState extends SocialStates{}

class SocialGetAllUsersErrorState extends SocialStates{

  final String error;
  SocialGetAllUsersErrorState(this.error);

}







class SocialGetPostsSuccessState extends SocialStates{}
class SocialGetPostsLoadingState extends SocialStates{}

class SocialGetPostsErrorState extends SocialStates{

  final String error;
  SocialGetPostsErrorState(this.error);

}


class SocialLiskePostSuccessState extends SocialStates{}
class SocialLiskePostErrorState extends SocialStates{

  final String error;
  SocialLiskePostErrorState(this.error);

}

class SocialLiskePostNumberSuccessState extends SocialStates{}
class SocialLiskePostNumberErrorState extends SocialStates{

  final String error;
  SocialLiskePostNumberErrorState(this.error);

}






class SocialChangeBottomNavstate extends SocialStates{}
class SocialNewPoststate extends SocialStates{}
class SocialProfileImagePickedSuccessstate extends SocialStates{}

class SocialProfileImagePickedErrorstate extends SocialStates{}
class SocialCoverImagePickedSuccessstate extends SocialStates{}

class SocialCoverImagePickedErrorstate extends SocialStates{}

class SocialPostImagePickedSuccessstate extends SocialStates{}

class SocialPostImagePickedErrorstate extends SocialStates{}


class SocialProfileFromCameraImagePickedSuccessstate extends SocialStates{}

class SocialProfileFromCameraImagePickedErrorstate extends SocialStates{}

class SocialUploadProfileImageSuccessstate extends SocialStates{}

class SocialUploadProfileImageErrorstate extends SocialStates{}

class SocialUploadCoverImageSuccessstate extends SocialStates{}

class SocialUploadCoverImageErrorstate extends SocialStates{}

class SocialUserUpdateLoadingstate extends SocialStates{}

class SocialUserUpdateErrorstate extends SocialStates{}

// Create Post

class SocialCreatePostLoadingstate extends SocialStates{}
class SocialCreatePostSuccessstate extends SocialStates{}

class SocialCreatePostErrorstate extends SocialStates{}

class SocialRemovePostImagestate extends SocialStates{}








