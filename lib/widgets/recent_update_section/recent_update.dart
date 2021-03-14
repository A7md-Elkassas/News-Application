import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/articles_view_model.dart';
import './single_update.dart';
import '../../utilities/app_utility.dart';

class RecentUpdate extends StatelessWidget {
  final List<Color> randomColor = [Colors.orange,Colors.tealAccent,Colors.purple];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
       Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: drawSection('Recent Updates'),
            ),
            FutureBuilder(
        future: Provider.of<ArticlesViewModel>(context).fetchArticlesByCat(),
        builder:(ctx,snapshot)=> !snapshot.hasData&&snapshot.connectionState == ConnectionState.waiting ?Center(child:CircularProgressIndicator()):
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: List.generate(3, (index) => SingleUpdate(color:randomColor[index],tag:'Sport',article:snapshot.data[index]))
                /*[
                  SingleUpdate(color:Colors.deepOrange, tag:'Buisness',
                    article: snapshot.data[1]),
                  SizedBox(
                    height: 15,
                  ),
                  SingleUpdate(color:Colors.tealAccent, tag:'Buisness',
                      article: snapshot.data[0]),
                ],*/
              ),
            ),
            )
          ],
        ),
    );
  }
}
