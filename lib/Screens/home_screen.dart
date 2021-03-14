import 'package:flutter/material.dart';
import 'package:new_app/home_tabs/favourated.dart';
import 'package:new_app/home_tabs/popular.dart';
import 'package:new_app/home_tabs/what\'s_new.dart';
import 'package:new_app/shared_ui/navigation_drawer.dart';

import '../shared_ui/navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum popUpMenu { ABOUT, HELP, CONTACT, SETTING }

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabcontroller;

  @override
  void initState() {
    _tabcontroller = TabController(initialIndex: 0, length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text('Explore'),
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabcontroller,
          tabs: [
            Tab(
              text: 'What\'s New',
            ),
            Tab(
              text: 'POPULAR',
            ),
            Tab(
              text: 'Favorated',
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          _popUpMenu(),
        ],
      ),
      body: Center(
        child: TabBarView(
          controller: _tabcontroller,
          children: [
            New(),
            Popular(),
            Favourated(),
          ],
        ),
      ),
    );
  }

  Widget _popUpMenu() {
    return PopupMenuButton<popUpMenu>(
      icon: Icon(Icons.more_vert),
      onSelected: (popUpMenu menu) {
        //TODO:
      },
      itemBuilder: (ctx) {
        return [
          PopupMenuItem<popUpMenu>(
            value: popUpMenu.ABOUT,
            child: Text('ABOUT'),
          ),
          PopupMenuItem<popUpMenu>(
            value: popUpMenu.HELP,
            child: Text('HELP'),
          ),
          PopupMenuItem<popUpMenu>(
            value: popUpMenu.SETTING,
            child: Text('SETTING'),
          ),
          PopupMenuItem<popUpMenu>(
            value: popUpMenu.CONTACT,
            child: Text('CONTACT'),
          ),
        ];
      },
    );
  }
}
