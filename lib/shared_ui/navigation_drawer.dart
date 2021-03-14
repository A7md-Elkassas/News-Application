import 'package:flutter/material.dart';

import '../models/nav_menu.dart';
import '../Screens/home_screen.dart';
import '../Screens/headline_news.dart';
import '../Screens/twitter_feed.dart';
import '../Screens/instgram_feed.dart';
import '../Screens/facebook_feed.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<NavMenuItem> navigateTabs = [
    NavMenuItem('Explore', ()=> HomeScreen()),
    NavMenuItem('Headline News', ()=>HeadLineNews() ),
    NavMenuItem('Twitter Feed', ()=>TwitterFeed() ),
    NavMenuItem('Instgram Feed', ()=>InstagramFeed() ),
    NavMenuItem('FaceBook Feed', ()=>FaceBookFeed() ),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(left: 16, top: 40),
        child: ListView.builder(
            itemCount: navigateTabs.length,
            itemBuilder: (ctc, index) {
              return ListTile(
                title: Text(
                  navigateTabs[index].title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade700,
                  ),
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder:(context){
                    return navigateTabs[index].destination();
                  } ));
                },
              );
            }),
      ),
    );
  }
}
