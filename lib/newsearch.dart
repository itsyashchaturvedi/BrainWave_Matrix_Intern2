import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class NewSearch extends StatefulWidget {
  String newsUrl;

  NewSearch({super.key,required this.newsUrl});

  @override
  State<NewSearch> createState() => _NewSearchState();
}

class _NewSearchState extends State<NewSearch> {
  Completer <WebViewController> controller=Completer<WebViewController>();

  @override
  void initState() {
    setState(() {
      widget.newsUrl=widget.newsUrl.contains("http:")? widget.newsUrl.replaceAll("http:", "https:"):widget.newsUrl;
    });
    super.initState();

  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("News App"),),
      body:  WebView(
        initialUrl: widget.newsUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webController){
          setState(() {
            controller.complete(webController);
          });
        },
      ),
    );
  }
}
