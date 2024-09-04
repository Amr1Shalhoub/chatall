

//https://newsapi.org/v2/everything?q=tesla&from=2022-08-27&sortBy=publishedAt&apiKey=API_KEY
//https://newsapi.org/v2/everything?q=tesla&apiKey=API_KEY
//cd23a9a54d62445283793b029ad55897
//65f7f556ec76449fa7dc7c0069f040ca
//1.3.50 this is the old kotlin vesion inside app/build gradle
//https\://services.gradle.org/distributions/gradle-6.7-all.zip   that is the old line in gradle_wrapper.properties
//https\://services.gradle.org/distributions/gradle-6.7.1-all.zip that is the middle line in gradle_wrapper.properties
//com.android.tools.build:gradle:4.1.0  this is the old class path inside app/build gradle




import 'package:messenger_design2/shared/components/components.dart';

import '../../modules/shop_app/login/shop_login_screen.dart';
import '../network/local/cache_helper.dart';

void Siginout(context)
{
  CacheHelper.removeData(key: 'token').then((value) {

    if(value)
    {
      navigateAndFinish(context, ShopLoginScreen());
    }

  } );
}
 String? token;
String? uId;