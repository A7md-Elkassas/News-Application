import 'package:flutter/material.dart';
import 'package:new_app/models/article.dart';

class ArticleDetialScreen extends StatelessWidget {
  static const route ='/article_details_screen';

  final Article article;
  ArticleDetialScreen([this.article]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
          body: Container(
      color: Colors.teal,
      ),
    );
  }
}