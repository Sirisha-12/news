import 'package:news/model/slider_model.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class Sliders {
  List<SliderModel> sliders = [];

  Future<void> getSlider() async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=7dc2b6db0e144b51bb468525d9303bbf';

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    // var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          SliderModel sliderModel = SliderModel(
            author: element['author'],
            content: element['content'],
            description: element['description'],
            // publishedAt: element['publishedAt'],
            title: element['title'],
            url: element['url'],
            urlToImage: element['urlToImage'],
          );
          sliders.add(sliderModel);
        }
      });
    }
  }
}
