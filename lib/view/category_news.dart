import 'package:flutter/material.dart';
import 'package:news/models/article_model.dart';
import 'package:news/models/articles.dart';
import 'package:news/models/categories.dart';
import 'package:news/view/home_screen.dart';
class CategoryNews extends StatefulWidget {
   CategoryNews({super.key,required this.category});
  String? category;

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel>articles=[];
  bool loading = true;

  @override
  void initState() {
    getCategoryNews();

    super.initState();
  }
  getCategoryNews() async{
    AllNews categorynews=AllNews();
    await categorynews.getNews(widget.category);
    articles=categorynews.news;
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
