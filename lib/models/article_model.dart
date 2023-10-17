class ArticleModel {
  final String? image;
  final String title;
  final String? details;
  final String url;

  const ArticleModel(
      {required this.image, required this.title, required this.details, required this.url});

  factory ArticleModel.fromJson(json) {
    return ArticleModel(
      image: json['urlToImage'],
      title: json['title'],
      details: json['description'],
      url: json['url'],
    );
  }
}
