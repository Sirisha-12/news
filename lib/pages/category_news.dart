import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/show_category.dart';
import 'package:news/pages/article_view.dart';
import 'package:news/services/show_category_news.dart';

class CategoryNews extends StatefulWidget {
  final String name;
  const CategoryNews({super.key, required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> category = [];
  bool _loading = true;

  @override
  void initState() {
    getCategoryNews();
    super.initState();
  }

  getCategoryNews() async {
    ShowCategoryNews categoryNews = ShowCategoryNews();
    await categoryNews.getCategoriesNews(widget.name.toLowerCase());
    // category = categoryNews.showCategories;
    category = categoryNews.showCategories;

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          widget.name,
          style: const TextStyle(
              color: Colors.indigo, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(1),
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: category.length,
          itemBuilder: (context, index) {
            return ShowCategory(
              url: category[index].url ?? '',
              image: category[index].urlToImage ?? '',
              desc: category[index].description ?? '',
              title: category[index].title ?? '',
            );
          },
        ),
      ),
    );
  }
}

class ShowCategory extends StatelessWidget {
  final String image, desc, title, url;
  const ShowCategory(
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
