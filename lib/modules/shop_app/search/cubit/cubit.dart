

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_design2/models/shop_app/search_model.dart';
import 'package:messenger_design2/modules/shop_app/search/cubit/states.dart';
import 'package:messenger_design2/shared/components/constants.dart';
import 'package:messenger_design2/shared/network/end_points.dart';
import 'package:messenger_design2/shared/network/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit():super(SearchInitialState());

  static SearchCubit get(context)=>BlocProvider.of(context);
 late  SearchModel model;
 void Search(String text)
 {
   emit(SearchLoadingState());
   DioHelper.postData(url: Search_product,token: token, data: {
     'text':text,

   }).then((value) {
     model =SearchModel.fromJson(value.data);
     emit(SearchSuccessState());

   }).catchError((error){
     print(error.toString());
     emit(SearchErrorState());
   });

 }

}