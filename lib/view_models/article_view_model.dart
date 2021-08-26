import 'package:brinvestyuk/models/article_model.dart';

class ArticleViewModel {
  ArticleModel? _articlesModel;

  ArticleViewModel({ArticleModel? article}) : _articlesModel = article;

  String get title {
    return _articlesModel!.title;
  }

  String get body {
    return _articlesModel!.body;
  }

  String get image {
    return _articlesModel!.image!;
  }

  String get createdAt {
    return _articlesModel!.createdAt;
  }
}
