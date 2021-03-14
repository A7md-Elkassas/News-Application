import 'package:flutter/material.dart';
import 'package:new_app/Screens/article_detail_screen.dart';
import 'package:new_app/models/article.dart';
import '../../utilities/app_utility.dart';

class SingleRow extends StatelessWidget {
  final Article article;
   SingleRow(this.article);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: Row(
    children: [
      SizedBox(
        width: 100,
        height: 100,
        child: Padding(
          padding: EdgeInsets.only(right: 10),
          child: Image.network(
            article.urlToImage == null ?"https://via.placeholder.com/100":article.urlToImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Expanded(
        child: Column(children: [
          Text(
            article.title,
            maxLines: 2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(article.author==null?"":article.author)),
              SizedBox(
                width: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.timer,
                  ),
                  Text('${parseDate(article.publishedAt)}'),
                ],
              ),
            ],
          ),
        ]),
      ),
    ],
        ),
      );
  }
}