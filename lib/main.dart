import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:hexcolor/hexcolor.dart';
//import 'package:hexcolor/hexcolor.dart';
import 'package:messenger_design2/layout/cubit/cubit.dart';
//import 'package:messenger_design2/layout/new_app/news_layout.dart';
import 'package:messenger_design2/layout/shop_app/shop_app_cubit/cubit.dart';
import 'package:messenger_design2/layout/shop_app/shop_layout.dart';
import 'package:messenger_design2/layout/social_app/cubit/cubit.dart';
import 'package:messenger_design2/layout/social_app/social_layout.dart';
//import 'package:messenger_design2/layout/todo_app/todo_layout.dart';
//import 'package:messenger_design2/modules/bmi_result/bmi_result_screen.dart';
//import 'package:messenger_design2/modules/counter/counter_screen.dart';
import 'package:messenger_design2/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:messenger_design2/modules/social_app/social_login/social_login_screen.dart';
//import 'package:messenger_design2/modules/login/login_screen.dart';
//import 'package:messenger_design2/modules/messenger/messenger_screen.dart';
//import 'package:messenger_design2/modules/new_tasks/new_tasks_screen.dart';
//import 'package:messenger_design2/modules/users/users_screen.dart';
import 'package:messenger_design2/shared/bloc_observer.dart';
import 'package:messenger_design2/shared/components/constants.dart';
import 'package:messenger_design2/shared/cubit/cubit.dart';
import 'package:messenger_design2/shared/cubit/states.dart';
import 'package:messenger_design2/shared/network/local/cache_helper.dart';
import 'package:messenger_design2/shared/network/remote/dio_helper.dart';
import 'package:messenger_design2/shared/styles/themes.dart';

import 'modules/shop_app/login/shop_login_screen.dart';
//import 'firebase_options.dart';

//import 'modules/bmi/bmi_screen.dart';
//./gradlew signingReport

Future<void> firebaseMessagingBackgroundHandler (RemoteMessage message) async{

  print('Background message');
}
Future<void> setupInteractedMessage()async{
  await FirebaseMessaging.instance.getInitialMessage();
}


void main() async{
  //await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // We use this methode to ensure the run when we use async in main
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging messaging=FirebaseMessaging.instance;

  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );


  var token = await FirebaseMessaging.instance.getToken();
  print(token);
  setupInteractedMessage();

  FirebaseMessaging.onMessage.listen((event) {
    print(event.data.toString());
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print(event.data.toString());
  });
  
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);



  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getData(key: 'isDark')??false;
  Widget widget;
  bool onBoarding = CacheHelper.getData(key: 'onBoarding')??false;
//   token = CacheHelper.getData(key: 'token');

  //token = CacheHelper.getData(key: 'token');
 uId=CacheHelper.getData(key: 'uId');

if(uId!=null)
  {

    widget=SocialLayout();

  }
else
  {
    widget=SocialLoginScreen();
  }
//print(onBoarding);

// if(onBoarding!=false)
// {
//   if(token!=null)
//   {
//     widget=ShopLayout();
//   }
//   else
//   {
//     widget=ShopLoginScreen();
//   }
//
// }else widget=OnBoardingScreen();

  // Use cubits...

 // isDark!   we write it inside my app prackets
  runApp( MyApp(
    isDark: isDark,
    onBoarding: onBoarding,
    Startwidget: widget,
  ));
}


class MyApp extends StatelessWidget {
   bool isDark;
   bool onBoarding;
   Widget Startwidget;

  MyApp({required this.isDark,required this.onBoarding,required this.Startwidget});
 // const MyApp({Key? key}) : super(key: key);



  @override

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context)=>NewsCubit()..getBusiness(),),
        // we write..ChangeAppMode(
        //     fromShared: isDark,
        //     ), after AppCubit()
        BlocProvider(create: (BuildContext context)=>AppCubit()..ChangeAppMode(
        fromShared: isDark,
         ), //after AppCubit(),
    ),
        BlocProvider(create: (BuildContext context)=>ShopCubit()..getHomeData()..getCategories()..getFavorites()..getUserData(),//after AppCubit(),
        ),
        BlocProvider(create: (BuildContext context)=>SocialCubit()..getUserData()..getPosts(),//after AppCubit(),
        ),


      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state)
        {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lighttheme,
            darkTheme: darktheme,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: Directionality(
                textDirection: TextDirection.ltr,
                child:Startwidget

                //SocialLoginScreen(),
                //Startwidget
                //NewsLayout()
               // Startwidget
                //onBoarding ? ShopLoginScreen() :OnBoardingScreen(),
            ),
          );
        },

      ),
    );
  }
}



/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MeterialApp();
   /* return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );*/
  }
}*/
/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}*/
/*

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
