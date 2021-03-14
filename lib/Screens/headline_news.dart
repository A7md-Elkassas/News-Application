import 'package:flutter/material.dart';
import 'package:new_app/home_tabs/favourated.dart';
import 'package:new_app/home_tabs/popular.dart';
import 'package:new_app/shared_ui/navigation_drawer.dart';

class HeadLineNews extends StatefulWidget {
  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews> with TickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text('HeadLine News'),
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
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
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: TabBarView(
          controller: _tabController,
          children: [
            Favourated(),
            Popular(),
            Favourated(),
          ],
        ),
      ),
    );
  }
}
