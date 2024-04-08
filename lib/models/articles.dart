// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';


import 'package:http/http.dart'as http;
import 'package:news/models/article_model.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> GetNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=bdf866eabd7b47179cdf7c254a92df05';
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description" != null]) {
          ArticleModel articlemodel = ArticleModel(
            title: element["title"],
            description: element["description"],
            urlToImage: element["urlToImage"],
            url: element["url"]
          );
          news.add(articlemodel);
        }
      });
    }
  }
}

class AllNews {
  List<ArticleModel> news = [];

  Future<void> getNews(String? category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=bdf866eabd7b47179cdf7c254a92df05';
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description" != null]) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            description: element["description"],
            urlToImage: element["urlToImage"],
          );
          news.add(articleModel);
        }
        ;
      });
    }
  }
}
