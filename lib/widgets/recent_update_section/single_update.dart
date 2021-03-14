import 'package:flutter/material.dart';
import 'package:new_app/models/article.dart';
import '../../utilities/app_utility.dart';

class SingleUpdate extends StatelessWidget {

  final Article article;
  final Color color;
  final String tag;
  SingleUpdate({this.article,this.color,this.tag});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: NetworkImage(article.urlToImage == null? "https://via.placeholder.com/100" :article.urlToImage ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: color,
              ),
              padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              child: Text(
                tag,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
            child: Text(
              article.title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, bottom: 15),
            child: Row(
              children: [
                Icon(Icons.timer),
                SizedBox(
                  width: 10,
                ),
                Text("${parseDate(article.publishedAt)}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}