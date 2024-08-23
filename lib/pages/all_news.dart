import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/article_model.dart';
import 'package:news/model/slider_model.dart';
import 'package:news/pages/article_view.dart';
import 'package:news/services/article_data.dart';

import 'package:news/services/slider_data.dart';

class AllNews extends StatefulWidget {
  final String news;
  const AllNews({super.key, required this.news});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<SliderModel> slider = [];
  List<ArticleModel> articles = [];
  getNews() async {
    News newNews = News();
    await newNews.getNews();
    articles = newNews.news;
    setState(() {
      // _loading = false;
    });
  }

  getSlider() async {
    Sliders slidernew = Sliders();
    await slidernew.getSlider();
    slider = slidernew.sliders;
    setState(() {});
  }

  @override
  void initState() {
    // slider = sliders;
    getSlider();
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            "${widget.news} News",
            style: const TextStyle(
                color: Colors.indigo, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(1),
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount:
                widget.news == "Breaking" ? slider.length : articles.length,
            itemBuilder: (context, index) {
              return AllNewsSection(
                url: widget.news == "Breaking"
                    ? slider[index].url!
                    : articles[index].url!,
                image: widget.news == "Breaking"
                    ? slider[index].urlToImage!
                    : articles[index].urlToImage!,
                desc: widget.news == "Breaking"
                    ? slider[index].description!
                    : articles[index].description!,
                title: widget.news == "Breaking"
                    ? slider[index].title!
                    : articles[index].title!,
              );
            },
          ),
        ));
  }
}

class AllNewsSection extends StatelessWidget {
  final String image, desc, title, url;
  const AllNewsSection(
      {super.key,
      required this.image,
      required this.desc,
      required this.title,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ArticleView(blogUrl: url);
          },
        ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: image,
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 1,
            ),
            Text(
              desc,
              maxLines: 3,
              style: const TextStyle(color: Colors.black87, fontSize: 13),
            ),
            const SizedBox(
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
