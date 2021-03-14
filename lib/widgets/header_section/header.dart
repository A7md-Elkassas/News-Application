import 'dart:math';

import 'package:flutter/material.dart';
import 'package:new_app/Screens/article_detail_screen.dart';
import 'package:provider/provider.dart';

import '../../view_model/articles_view_model.dart';
import '../../utilities/app_utility.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<ArticlesViewModel>(context).fetchArticles(),
        builder: (context,snapshot){
    switch(snapshot.connectionState){
       case ConnectionState.none:
       return Text("There is no Connection");
       break;
       case ConnectionState.waiting:
       if(!snapshot.hasData && snapshot.hasError){
         return Text("Error Retreiving Data");
       }
       break;
       case ConnectionState.active:
       case ConnectionState.done:
       Random random = Random();
      int randomIndex = random.nextInt(snapshot.data.length);
      return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.30,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(snapshot.data[randomIndex].urlToImage),
      ),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 48, right: 48),
            child: Text(
              '${snapshot.data[randomIndex].title}',
              textAlign: TextAlign.center,
              style: headerStyle,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.only(left: 34, right: 34),
            child: Text('${snapshot.data[randomIndex].description}',
              overflow: TextOverflow.ellipsis,   
                textAlign: TextAlign.center, style: headerTextDescription),
          ),
        ],
      ),
    ),
        );
        break;
    }
       return Center(child:CircularProgressIndicator());
  }
      );
  }
}

 
