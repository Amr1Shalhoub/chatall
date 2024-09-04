import 'package:messenger_design2/models/shop_app/login_model.dart';

abstract class SocialLoginStates {}



class SocialLoginInitialState extends SocialLoginStates{}
class SocialLoginLoadingState extends SocialLoginStates{}
class SocialLoginSuccessState extends SocialLoginStates{
  final String uId;
  SocialLoginSuccessState(this.uId);


}
class SocialLoginErrorState extends SocialLoginStates
{
 // SocialLoginModel loginModel;
  final String error;
  SocialLoginErrorState(this.error,
     // this.loginModel,

      );
}
class SocialChangePasswordVisibilityState extends SocialLoginStates{}
// class SocialLoginDatanullErrorState extends SocialLoginStates{
//   SocialLoginModel loginModel;
//   SocialLoginDatanullErrorState(this.loginModel);
// }