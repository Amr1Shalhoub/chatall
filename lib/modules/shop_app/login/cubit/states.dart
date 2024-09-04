import 'package:messenger_design2/models/shop_app/login_model.dart';

abstract class ShopLoginStates {}



class ShopLoginInitialState extends ShopLoginStates{}
class ShopLoginLoadingState extends ShopLoginStates{}
class ShopLoginSuccessState extends ShopLoginStates{
   ShopLoginModel loginModel;
  ShopLoginSuccessState(this.loginModel);
}
class ShopLoginErrorState extends ShopLoginStates
{
 // ShopLoginModel loginModel;
  final String error;
  ShopLoginErrorState(this.error,
     // this.loginModel,

      );
}
class ShopChangePasswordVisibilityState extends ShopLoginStates{}
// class ShopLoginDatanullErrorState extends ShopLoginStates{
//   ShopLoginModel loginModel;
//   ShopLoginDatanullErrorState(this.loginModel);
// }