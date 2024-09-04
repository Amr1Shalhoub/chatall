import 'package:messenger_design2/models/shop_app/login_model.dart';

abstract class ShopRegisterStates {}



class ShopRegisterInitialState extends ShopRegisterStates{}
class ShopRegisterLoadingState extends ShopRegisterStates{}
class ShopRegisterSuccessState extends ShopRegisterStates{
   ShopLoginModel loginModel;
  ShopRegisterSuccessState(this.loginModel);
}
class ShopRegisterErrorState extends ShopRegisterStates
{
 // ShopRegisterModel loginModel;
  final String error;
  ShopRegisterErrorState(this.error,
     // this.loginModel,

      );
}
class ShopRegisterChangePasswordVisibilityState extends ShopRegisterStates{}
// class ShopRegisterDatanullErrorState extends ShopRegisterStates{
//   ShopRegisterModel loginModel;
//   ShopRegisterDatanullErrorState(this.loginModel);
// }