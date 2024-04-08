// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/article_model.dart';
import 'package:news/models/articles.dart';
import 'package:news/models/categories.dart';
import 'package:news/models/category_model.dart';
import 'package:news/view/article_view.dart';
import 'package:news/view/category_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.category});
  final String? category;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel>category=[];
  List<ArticleModel>articles=[];
  bool loading=true;
  @override
  void initState() {

    super.initState();
    category=getcategory();
    getNews();

  }
  getNews() async{
    News newsClass=News();
    await newsClass.GetNews();
    newsClass.news;
    setState(() {
      loading=false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body:loading? Center(
          child: CircularProgressIndicator(),
        ): Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child:SingleChildScrollView(child:
          Column(
            children: [
              Container(
                height: 110,
                child: ListView.builder(

                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: category.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                      return CategoryTile(
                        imageurl: category[index].urlImage,
                        Title: category[index].categoryTitle,
                      );
                    }),
              ),
              Container(
                height: 80,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: articles.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                      return Articles(
                        imageurl: articles[index].urlToImage,
                        title: articles[index].title,
                        description: articles[index].description,
                        url: articles[index].url,
                      );
                    }),
              )
            ],
          ),
          ),
        )
    );
  }
}
class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key,this.imageurl,this.Title});

  final String? imageurl,Title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryNews(category: Title!.toLowerCase())));
      },
      child:
      Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl:imageurl!,
              height: 110,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          Container(

            width: 150,
            height: 110,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(10),
            ),
            child:Center(child:Text(Title!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),)
          )
        ],
      ),
      )
    );
  }
}
class Articles extends StatelessWidget {
  const Articles({super.key, this.imageurl, this.title, this.description, this.url});

  final String? imageurl,title,description,url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleView(urlBlog: url,)));
        },
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              ClipRRect(

                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageurl!,
                  width: 100,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
              Text(title!,style: TextStyle(fontSize: 17,color: Colors.black87),),
              Text(description!,style: TextStyle(color: Colors.grey),)
            ],
          ),
        )
    );
  }
}


