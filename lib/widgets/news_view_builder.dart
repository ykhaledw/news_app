import 'package:flutter/material.dart';
import 'package:new_app/models/article_model.dart';
import 'package:new_app/pages/news_view.dart';
import 'package:new_app/services/news_service.dart';

class NewsViewBuilder extends StatefulWidget {
  const NewsViewBuilder({super.key, required this.category});

  final String category;

  @override
  State<NewsViewBuilder> createState() => _NewsViewBuilderState();
}

class _NewsViewBuilderState extends State<NewsViewBuilder> {
  var future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = NewsService().getNews(Category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsView(articles: snapshot.data!);
          } else if (snapshot.hasError) {
            return SliverToBoxAdapter(child: Text('There was an error'));
          } else {
            return SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
