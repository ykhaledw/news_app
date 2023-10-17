import 'dart:io';

import 'package:dio/dio.dart';
import 'package:new_app/models/article_model.dart';

class NewsService {
  final Dio dio = Dio();

  Future<List<ArticleModel>> getNews({required String Category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?apiKey=a9250a5c57504635ac485081a95113da&category=$Category&country=us');

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articleList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);

        articleList.add(articleModel);
      }

      return articleList;
    } on SocketException catch (e) {
      print(e);
      return []; // TODO
    }
  }
}
