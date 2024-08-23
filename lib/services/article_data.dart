// import 'dart:convert';

import 'dart:convert';

import 'package:news/model/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/everything?q=apple&from=2024-08-03&to=2024-08-03&sortBy=popularity&apiKey=7dc2b6db0e144b51bb468525d9303bbf';
    // 'https://newsapi.org/v2/everything?q=tesla&from=2024-07-03&sortBy=publishedAt&apiKey=7dc2b6db0e144b51bb468525d9303bbf';
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    // var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element['author'],
            content: element['content'],
            description: element['description'],
            // publishedAt: element['publishedAt'],
            title: element['title'],
            url: element['url'],
            urlToImage: element['urlToImage'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
