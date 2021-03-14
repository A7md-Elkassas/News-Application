import 'package:flutter/material.dart';
import 'package:new_app/view_model/articles_view_model.dart';
import 'package:new_app/widgets/top_stories_section/single_row.dart';
import 'package:provider/provider.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
       future: Provider.of<ArticlesViewModel>(context).fetchArticles(),
        builder: (context, snapshot) {
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
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: SingleRow(snapshot.data[index]),
                );
              });
           break;
         }
         return Center(child: CircularProgressIndicator(),);
        });
  }
}