class ArticleModel {
  final String title, body, createdAt;
  String? image;

  ArticleModel({
    required this.title,
    required this.body,
    this.image,
    required this.createdAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        title: json["title"],
        body: json["body"],
        image: json["image"],
        createdAt: json["createdAt"]);
  }
}
