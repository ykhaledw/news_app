import 'package:flutter/material.dart';
import 'package:new_app/models/article_model.dart';
import 'package:new_app/widgets/news_item.dart';

class NewsView extends StatelessWidget {
  final List<ArticleModel> articles;

  NewsView({required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: articles.length,
            (context, index) => NewsItem(
                  articleModel: articles[index],
                )));

    /*Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: news.length,
        itemBuilder: (context, i) => NewsItem(newsObject: news[i]),
      ),
    );*/
    /*ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, i) => NewsItem(news: news[i]),
      ),*/
  }
}
