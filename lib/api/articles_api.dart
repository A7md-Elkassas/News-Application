import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article.dart';
import '../models/articles.dart';
import '../utilities/api_utility.dart';

class ArticlesApi {


  Future<List<Article>> _baseFetch(String value) async {
    String articlesUrl = baseApi + value;
    try {
      http.Response response = await http.get(articlesUrl);
      if (response.statusCode == 200) {
        String body = response.body;
        var decodedData = jsonDecode(body);
        Articles articles = Articles.fromJson(decodedData);
        List<Article> articlesList =
            articles.articles.map((item) => Article.fromJson(item)).toList();
        return articlesList;
      } else {
        print('Status Code is ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }


  Future<List<Article>> fetchAllArticles()  {
   return _baseFetch(topHeadLines);
  }

  Future<List<Article>> fetchAllArticlesByCat()  {
   return _baseFetch(articlesBySport);
  }
  Future<List<Article>> fetchAllArticlesByBuisness()  {
   return  _baseFetch(articlesByBusiness);
  }
}
