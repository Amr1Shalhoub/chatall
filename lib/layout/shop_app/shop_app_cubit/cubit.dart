

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/layout/shop_app/shop_app_cubit/states.dart';
import 'package:messenger_design2/models/shop_app/categories_model.dart';
import 'package:messenger_design2/models/shop_app/categories_model.dart';
import 'package:messenger_design2/models/shop_app/favorites_model.dart';
import 'package:messenger_design2/models/shop_app/home_model.dart';
import 'package:messenger_design2/models/shop_app/login_model.dart';
import 'package:messenger_design2/modules/shop_app//settings/settings_screen.dart';
import 'package:messenger_design2/modules/shop_app/categories/catagories_screen.dart';
import 'package:messenger_design2/modules/shop_app/favorites/favorites_screen.dart';
import 'package:messenger_design2/modules/shop_app/products/products_screen.dart';
import 'package:messenger_design2/shared/components/constants.dart';
import 'package:messenger_design2/shared/network/end_points.dart';
import 'package:messenger_design2/shared/network/remote/dio_helper.dart';

import '../../../models/shop_app/change_favorites_model.dart';

class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit():super(ShopInitialState()) ;

  static ShopCubit get(context)=>BlocProvider.of(context);
  int currentIndex = 0;
List<Widget> bottomscreens=
[
  ProductsScreen(),
  CategoriesScreen(),
  FavoritesScreen(),
  SettingsScreen(),

  ];
void ChangeBottomNav(int index)
{
  currentIndex=index;
  emit(ShopChangeBottomNavState());
}

late HomeModel homeModel=HomeModel();
 Map<int,bool> favorites={};

void getHomeData()

 {
  emit(ShopLoadingHomeDataState());
   DioHelper.getData(url: Home, token: token,).then((value) {

    homeModel=HomeModel.fromJson(value.data);
    print(homeModel.data.banners[1].image);
    print(homeModel.data.products[2].name);


    homeModel.data.products.forEach((element) {
      favorites.addAll({
        element.id:element.in_favorites,
      });



    });
    print(favorites.toString());
   // print(homeModel.data?.products);


   // print(homeModel.Banner?.id);
   // print(homeModel.data.);

    //print(homeModel.data.Banner.id);
    print(homeModel.status);



    emit(ShopSuccessHomeDataState());
  } ).catchError((error){
    print(error.toString());
    emit(ShopErrorHomeDataState());
  });
}

  late CategoriesModel categoriesModel=CategoriesModel();
  void getCategories()
  {
   // emit(ShopLoadingHomeDataState());
    DioHelper.getData(url: Get_Categories,
      token: token,
    ).then((value) {

      categoriesModel=CategoriesModel.fromJson(value.data);
     // print(homeModel.data.banners[1].image);
     // print(homeModel.data.products[2].name);
      // print(homeModel.data?.products);


      // print(homeModel.Banner?.id);
      // print(homeModel.data.);

      //print(homeModel.data.Banner.id);
    //  print(homeModel.status);



      emit(ShopSuccessGetCategoriesState());
    } ).catchError((error){
      print(error.toString());
      emit(ShopErrorGetCategoriesState());
    });
  }


 late ChangeFavoritesModel changeFavoritesModel;
void ChangeFavorites(int ProductId)
{
  favorites[ProductId]=!favorites[ProductId]!;
  emit(ShopChangeFavoritesState());

DioHelper.postData(
    url: Favorites,
    data: {
      'product_id':ProductId
    },
  token: token,
).then((value) {


  changeFavoritesModel=ChangeFavoritesModel.fromJson(value.data);
  print(value.data);
if(!changeFavoritesModel.status){
  favorites[ProductId]=!favorites[ProductId]!;
}else{
  getFavorites();
}

emit(ShopSuccessChangeFavoritesState(changeFavoritesModel));
}).catchError((erroe){
  favorites[ProductId]=!favorites[ProductId]!;
emit(ShopErrorChangeFavoritesState());
});
}


  late FavoritesModel favoritesModel;
  void getFavorites()
  {
    emit(ShopLoadingGetFavoritesState());
    // emit(ShopLoadingHomeDataState());
    DioHelper.getData(url: Favorites,
      token: token,
    ).then((value) {

      favoritesModel=FavoritesModel.fromJson(value.data);
      print(favoritesModel.status);
      // print(homeModel.data.banners[1].image);
      // print(homeModel.data.products[2].name);
      // print(homeModel.data?.products);


      // print(homeModel.Banner?.id);
      // print(homeModel.data.);

      //print(homeModel.data.Banner.id);
      //  print(homeModel.status);



      emit(ShopSuccessGetFavoritesState());
    } ).catchError((error){
      print(error.toString());
      emit(ShopErrorGetFavoritesState());
    });
  }

  late ShopLoginModel userModel;
  void getUserData()
  {
    emit(ShopLoadingUserDataState());
    // emit(ShopLoadingHomeDataState());
    DioHelper.getData(url: Profile,
      token: token,
    ).then((value) {

      userModel=ShopLoginModel.fromJson(value.data);
      print(userModel.status);
      print(userModel.data.name);
      // print(homeModel.data.banners[1].image);
      // print(homeModel.data.products[2].name);
      // print(homeModel.data?.products);


      // print(homeModel.Banner?.id);
      // print(homeModel.data.);

      //print(homeModel.data.Banner.id);
      //  print(homeModel.status);



      emit(ShopSuccessUserDataState(userModel));
    } ).catchError((error){
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }

  void updateUserData({required String name, required String email,required String phone})
  {
    emit(ShopLoadingUpdateUserState());
    // emit(ShopLoadingHomeDataState());
    DioHelper.putData(url: Update_profile,
      token: token,
      data: {
      'name':name,
        'email':email,
        'phone':phone,
      }
    ).then((value) {

      userModel=ShopLoginModel.fromJson(value.data);
      print(userModel.status);
      print(userModel.data.name);
      // print(homeModel.data.banners[1].image);
      // print(homeModel.data.products[2].name);
      // print(homeModel.data?.products);


      // print(homeModel.Banner?.id);
      // print(homeModel.data.);

      //print(homeModel.data.Banner.id);
      //  print(homeModel.status);



      emit(ShopSuccessUpdateUserState(userModel));
    } ).catchError((error){
      print(error.toString());
      emit(ShopErrorUpdateUserState());
    });
  }




}