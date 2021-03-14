import 'package:flutter/material.dart';

import '../shared_ui/navigation_drawer.dart';

class InstagramFeed extends StatefulWidget {
  @override
  _InstagramFeedState createState() => _InstagramFeedState();
}

class _InstagramFeedState extends State<InstagramFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(title: Text('Instagram Feed'), centerTitle: false, actions: [
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
      ]),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _drawHeader(),
                    _drawTitle(),
                    _drawHashTag(),
                    _drawImage(),
                    _drawFooter(),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _drawHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
              child: CircleAvatar(
                backgroundImage: ExactAssetImage('assets/images/user.png'),
                radius: 26,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Christina Meyers',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
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
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.grey.shade400,
              ),
              onPressed: () {},
            ),
            Transform.translate(
              offset: Offset(-12, 0),
              child: Text(
                '25',
                style: TextStyle(
                  color: Colors.grey.shade400,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _drawTitle() {
    return Padding(
      padding: EdgeInsets.only(bottom: 8, left: 16),
      child: Text(
        'We also talk about the future of work as the robots',
        style: TextStyle(
          color: Colors.grey.shade900,
        ),
      ),
    );
  }

  Widget _drawHashTag() {
    return Container(
      child: Wrap(
        children: [
          FlatButton(
            textColor: Colors.deepOrange,
            child: Text('#advance'),
            onPressed: () {},
          ),
          FlatButton(
            textColor: Colors.deepOrange,
            child: Text('#retro'),
            onPressed: () {},
          ),
          FlatButton(
            textColor: Colors.deepOrange,
            child: Text('#instagram'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _drawImage() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.50,
      child: Image(
        fit: BoxFit.cover,
        image: ExactAssetImage('assets/images/big.png'),
      ),
    );
  }

  Widget _drawFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlatButton(
          textColor: Colors.deepOrange,
          child: Text(
            '10 comments'.toUpperCase(),
          ),
          onPressed: () {},
        ),
       Row(
         children: [
           FlatButton(
             textColor: Colors.deepOrange,
             child: Text(
               'share'.toUpperCase(),
             ),
             onPressed: () {},
           ),
           FlatButton(
             textColor: Colors.deepOrange,
             child: Text(
               'open'.toUpperCase(),
             ),
             onPressed: () {},
           ),
         ],
       ),
      ],
    );
  }
}
