import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_app/models/article_model.dart';
import 'package:new_app/pages/web_view.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.articleModel});

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return WebViewPage(url: articleModel.url);
          }));
          print('News tapped');
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: articleModel.image != null
                  ? CachedNetworkImage(
                      imageUrl: articleModel.image!,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )
                  /*Image.network(
                      articleModel.image!,
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 300,
                    )*/
                  : Image.asset(
                      'assets/broken.jpg',
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 300,
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              articleModel.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              articleModel.details ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
    /*Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: GestureDetector(
        onTap: () {
          print('News Tapped');
        },
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(news.image, fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              news.title,
              style: TextStyle(
                  fontSize: 29,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              news.details,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    )*/
  }
}
