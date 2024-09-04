//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
//import 'package:webview_flutter/webview_flutter.dart';
//import 'package:webview_flutter/webview_flutter.dart';
//import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String url;
  WebViewScreen(this.url);
  // late WebViewController webcontroller;
  // WebViewScreen(this.webcontroller);
 // const WebViewScreen({Key? key}) : super(key: key);
  // final String url;
  // WebViewScreen(this.url);
  // void initState()
  // {
  //   //super.initState();
  //  // if(Platform.isAndroid) WebView.platform=AndroidWebView();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Center(
        child: WebView(
          initialUrl: url,
          //'https://inviktacoders.in/'
          javascriptMode: JavascriptMode.unrestricted,
          // onWebViewCreated: (WebViewController webViewController)
          // {
          //   webcontroller=webViewController;
          // },

        ),
      )
    );
  }
}
