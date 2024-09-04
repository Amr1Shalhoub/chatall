import 'package:messenger_design2/models/shop_app/login_model.dart';

abstract class SocialRegisterStates {}



class SocialRegisterInitialState extends SocialRegisterStates{}
class SocialRegisterLoadingState extends SocialRegisterStates{}
class SocialRegisterSuccessState extends SocialRegisterStates{}
class SocialRegisterErrorState extends SocialRegisterStates
{
 // SocialRegisterModel loginModel;
  final String error;
  SocialRegisterErrorState(this.error,
     // this.loginModel,

      );
}
class SocialRegisterChangePasswordVisibilityState extends SocialRegisterStates{}

// class SocialRegisterDatanullErrorState extends SocialRegisterStates{
//   SocialRegisterModel loginModel;
//   SocialRegisterDatanullErrorState(this.loginModel);
// }


class SocialCreateUserSuccessState extends SocialRegisterStates{}
class SocialCreateUserErrorState extends SocialRegisterStates
{
  // SocialCreateUserModel loginModel;
  final String error;
  SocialCreateUserErrorState(this.error,
      // this.loginModel,

      );
}



