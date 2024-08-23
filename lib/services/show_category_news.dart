import 'package:news/model/show_category.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class ShowCategoryNews {
  List<ShowCategoryModel> showCategories = [];

  Future<void> getCategoriesNews(String category) async {
    String url =
        // 'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=7dc2b6db0e144b51bb468525d9303bbf';
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=7dc2b6db0e144b51bb468525d9303bbf';
    // 'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=7dc2b6db0e144b51bb468525d9303bbf';

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    // var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ShowCategoryModel showCategoryModel = ShowCategoryModel(
            author: element['author'],
            content: element['content'],
            description: element['description'],
            // publishedAt: element['publishedAt'],
            title: element['title'],
            url: element['url'],
            urlToImage: element['urlToImage'],
          );
          showCategories.add(showCategoryModel);
        }
      });
    }
  }
}
