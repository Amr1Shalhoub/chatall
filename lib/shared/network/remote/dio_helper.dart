
//import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

class DioHelper {

  static Dio dio = Dio();

  static init() {
    dio = Dio(
      BaseOptions(
        //baseUrl: 'https://newsapi.org/',
       baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        // everything after this has nothing to do with the news app
         headers:
         {
           'Content-Type':'application/json',

         }
      ),

    );
  }
// we can also put query as dynamic or we can leave it empty
  static Future<Response> getData({
  required String url,
     Map<String,dynamic>?  query,
    String lang='en',
    String? token,
    //required query,
})
  async
  {
    dio.options.headers={
      //'Content-Type':'application/json',
      'lang':lang,
         'Authorization':token,
    };
    // =BaseOptions(
    //     headers:
    //     {
    //       'lang':lang,
    //       'Authorization':token,
    //
    //     }
    // );
   return await dio.get(url,queryParameters:query, );
  }
  static Future<Response> postData({
    required String url,
    required Map<String,dynamic>  data,
    String lang='en',
    String? token,
   // Map<String,dynamic>  query,
})async
  {
    dio.options.headers={
      //'Content-Type':'application/json',
      'lang':lang,
           'Authorization':token,
    };
    //     BaseOptions(
    //   headers:
    //   {
    //     'lang':lang,
    //     'Authorization':token,
    //
    //   }
    // );
    return dio.post(url,
      //queryParameters: query,
      data: data,
    );
  }


  static Future<Response> putData({
    required String url,
    required Map<String,dynamic>  data,
    String lang='en',
    String? token,
    // Map<String,dynamic>  query,
  })async
  {
    dio.options.headers={
      //'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token,
    };
    //     BaseOptions(
    //   headers:
    //   {
    //     'lang':lang,
    //     'Authorization':token,
    //
    //   }
    // );
    return dio.put(url,
      //queryParameters: query,
      data: data,
    );
  }

}