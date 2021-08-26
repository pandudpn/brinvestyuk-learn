import 'package:brinvestyuk/services/article.dart';
import 'package:flutter/material.dart';
import 'package:brinvestyuk/models/article_model.dart';
import 'package:brinvestyuk/services/web_service.dart';
import 'package:brinvestyuk/view_models/article_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class ArticleListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<ArticleViewModel>? articles = <ArticleViewModel>[];

  void getArticles() async {
    List<ArticleModel>? articleModel = await Article().fetchArticle();
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.articles = articleModel != null
        ? articleModel
            .map((article) => ArticleViewModel(article: article))
            .toList()
        : null;

    if (this.articles!.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }
}
