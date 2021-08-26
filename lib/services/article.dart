import 'package:brinvestyuk/models/article_model.dart';
import 'package:brinvestyuk/services/web_service.dart';

class Article {
  Future<List<ArticleModel>?> fetchArticle() async {
    String url = "https://api-staging.brinvestyuk.com/articles?page=1";

    try {
      final response = await WebService.get(url, null);
      Iterable list = response["data"]["articles"];

      return list.map((article) => ArticleModel.fromJson(article)).toList();
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
