import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/articles_view_model.dart';
import './single_row.dart';
import '../../utilities/app_utility.dart';

class TopStories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: drawSection('Top Stories'),
            ),
             FutureBuilder(
        future: Provider.of<ArticlesViewModel>(context).fetchArticlesByBuisness(),
        builder: (ctx,snapshot)=>!snapshot.hasData&&snapshot.connectionState==ConnectionState.waiting?Center(child: CircularProgressIndicator(),):
            Padding(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: Card(
                child: Column(
                  children: List.generate(3, (index){
                    return Column(
                      children: [
                        SingleRow(snapshot.data[index]),
                        if(index< 3)
                        Divider(
                          height:1,
                          color:Colors.grey,
                        ),
                      ],
                    );
                  })
                ),
              ),
            ),
             ),
          ],
        ),
    );
  }
}
