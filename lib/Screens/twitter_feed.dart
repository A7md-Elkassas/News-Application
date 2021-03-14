import 'package:flutter/material.dart';

import '../shared_ui/navigation_drawer.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(title: Text('Twitter Feed'), centerTitle: false, actions: [
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
      ]),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    _cardHeader(),
                    _cardBody(),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    _cardFooter(),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _cardHeader() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8, left: 16, right: 16),
          child: CircleAvatar(
            backgroundImage: ExactAssetImage('assets/images/user.png'),
            radius: 26,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Christina Meyers',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '@ch_meyers',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Fri, 12 May 2017 • 14.30',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _cardBody() {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
      child: Text(
        'We also talk about the future of work as the robots advance, and we ask whether a retro phone',
        style: TextStyle(
          wordSpacing: 1,
          height: 1.5,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _cardFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8, left: 8, bottom: 8),
              child: IconButton(
                color: Colors.deepOrange,
                iconSize: 30,
                icon: Icon(Icons.repeat),
                onPressed: () {},
              ),
            ),
            Transform.translate(
              offset: Offset(-12,0),
              child: Text(
                '25',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        FlatButton(
          textColor: Colors.deepOrange,
          child: Text('share'.toUpperCase()),
          onPressed: () {},
        ),
        FlatButton(
          textColor: Colors.deepOrange,
          child: Text('open'.toUpperCase()),
          onPressed: () {},
        ),
      ],
    );
  }
}
