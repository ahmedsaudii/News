// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
class ArticleView extends StatelessWidget {
  const ArticleView({super.key, this.urlBlog});
  final String? urlBlog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewPlus(
        initialUrl:urlBlog ,
      ),
    );
  }
}
