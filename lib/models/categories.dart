


import 'package:news/models/category_model.dart';

List<CategoryModel>getcategory(){
  List<CategoryModel>category=[];
  CategoryModel categories=CategoryModel();
  categories.categoryTitle="Business";
  categories.urlImage='https://imageio.forbes.com/specials-images/imageserve/633a774a842d06ecd68286ff/The-5-Biggest-Business-Trends-For-2023/960x0.jpg?height=430&width=711&fit=bounds';
  category.add(categories);

  categories=CategoryModel();
  categories.categoryTitle="sports";
  categories.urlImage='https://img.freepik.com/free-photo/sports-tools_53876-138077.jpg?size=626&ext=jpg&ga=GA1.1.1826414947.1699228800&semt=sph';
  category.add(categories);

  categories=CategoryModel();
  categories.categoryTitle="health";
  categories.urlImage='https://www.watford.gov.uk/images/health1.jpg';
  category.add(categories);

  categories=CategoryModel();
  categories.categoryTitle="science";
  categories.urlImage='https://img.freepik.com/free-vector/hand-drawn-science-education-background_23-2148499325.jpg';
  category.add(categories);

  categories=CategoryModel();
  categories.categoryTitle="technology";
  categories.urlImage='https://community.thriveglobal.com/wp-content/uploads/2017/09/Advancement-in-Technology.jpg';
  category.add(categories);

  return category;
}