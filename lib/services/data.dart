// import 'package:news/model/category_model.dart';

// List<CategoryModel> getCategories() {
//   List<CategoryModel> category = [];
//   CategoryModel categoryModel = CategoryModel();

//   categoryModel.categoryName = "Bussiness";
//   categoryModel.image = "assets/bussiness.jpg";
//   category.add(categoryModel);
//   categoryModel = CategoryModel();

//   categoryModel.categoryName = "Entertainment";
//   categoryModel.image = "assets/entertainment.jpg";
//   category.add(categoryModel);
//   categoryModel = CategoryModel();

//   categoryModel.categoryName = "General";
//   categoryModel.image = "assets/general.jpg";
//   category.add(categoryModel);
//   categoryModel = CategoryModel();

//   categoryModel.categoryName = "Health";
//   categoryModel.image = "assets/health.jpg";
//   category.add(categoryModel);
//   categoryModel = CategoryModel();

//   categoryModel.categoryName = "Sports";
//   categoryModel.image = "assets/sports.jpg";
//   category.add(categoryModel);
//   categoryModel = CategoryModel();

//   return category;
// }
import 'package:news/model/category_model.dart';

List<CategoryModel> categories = [
  CategoryModel(image: 'assets/bussiness.jpg', categoryName: 'Business'),
  CategoryModel(
      image: 'assets/entertainment.jpg', categoryName: 'Entertainment'),
  CategoryModel(image: 'assets/general.jpg', categoryName: 'General'),
  CategoryModel(image: 'assets/health.jpg', categoryName: 'Health'),
  CategoryModel(image: 'assets/science.jpg', categoryName: 'Science'),
  CategoryModel(image: 'assets/health.jpg', categoryName: 'Health'),
];
