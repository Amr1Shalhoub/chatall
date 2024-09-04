

import 'package:messenger_design2/models/shop_app/change_favorites_model.dart';
import 'package:messenger_design2/models/shop_app/login_model.dart';

abstract class ShopStates{}


class ShopInitialState extends ShopStates{}
class ShopChangeBottomNavState extends ShopStates{}
class ShopLoadingHomeDataState extends ShopStates{}
class ShopSuccessHomeDataState extends ShopStates{}
class ShopErrorHomeDataState extends ShopStates
{

}

class ShopSuccessGetCategoriesState extends ShopStates{}
class ShopErrorGetCategoriesState extends ShopStates
{

}
class ShopSuccessChangeFavoritesState extends ShopStates
{
  late ChangeFavoritesModel model;
  ShopSuccessChangeFavoritesState(this.model);

 // ShopSuccessChangeFavoritesState({required this.model});

}
class ShopErrorChangeFavoritesState extends ShopStates
{

}
class ShopChangeFavoritesState extends ShopStates{}


class ShopSuccessGetFavoritesState extends ShopStates{}
class ShopLoadingGetFavoritesState extends ShopStates{}
class ShopErrorGetFavoritesState extends ShopStates
{

}

class ShopSuccessUserDataState extends ShopStates{
  late ShopLoginModel loginModel;
  ShopSuccessUserDataState(this.loginModel);
}
class ShopLoadingUserDataState extends ShopStates{}
class ShopErrorUserDataState extends ShopStates
{

}

class ShopSuccessUpdateUserState extends ShopStates{
  late ShopLoginModel loginModel;
  ShopSuccessUpdateUserState(this.loginModel);
}
class ShopLoadingUpdateUserState extends ShopStates{}
class ShopErrorUpdateUserState extends ShopStates
{

}