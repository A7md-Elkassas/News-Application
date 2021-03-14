import 'package:flutter/cupertino.dart';
import 'package:new_app/api/articles_api.dart';

class ArticlesViewModel with ChangeNotifier {

  Future<void> fetchArticles() {
   return ArticlesApi().fetchAllArticles();
  }

  Future<void> fetchArticlesByCat() async {
    return ArticlesApi().fetchAllArticlesByCat();
  }
  Future<void> fetchArticlesByBuisness() async {
    return ArticlesApi().fetchAllArticlesByBuisness();
  }

}
