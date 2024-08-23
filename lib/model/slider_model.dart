// ignore_for_file: public_member_api_docs, sort_constructors_first
// class SliderModel {
//   String image;
//   String name;
//   SliderModel({
//     required this.image,
//     required this.name,
//   });
// }

class SliderModel {
  String? author;
  String? title;
  String? content;
  String? description;
  String? url;
  String? urlToImage;
  // String? publishedAt;
  SliderModel({
    this.author,
    this.title,
    this.content,
    this.description,
    this.url,
    this.urlToImage,
    // this.publishedAt,
  });
}
