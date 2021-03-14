import 'dart:math';

import 'package:flutter/material.dart';

class Favourated extends StatefulWidget {
  @override
  _FavouratedState createState() => _FavouratedState();
}

class _FavouratedState extends State<Favourated> {
  List<Color> colorsList = [
    Colors.red,
    Colors.teal,
    Colors.indigo,
    Colors.deepOrange,
    Colors.brown,
    Colors.purple,
  ];

  Random random = Random();

  Color _getRandomColor() {
    return colorsList[random.nextInt(colorsList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (ctx, index) {
      return Card(
        child: Container(
          child: Column(
            children: [
              _autherRow(),
              SizedBox(
                height: 16,
              ),
              _newsItemRow(),
            ],
          ),
        ),
      );
    });
  }

  Widget _autherRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ExactAssetImage('assets/images/user.png'),
                ),
                shape: BoxShape.circle,
              ),
              width: 50,
              height: 50,
              margin: EdgeInsets.only(right: 16, left: 16, top: 10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Michel Adams',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      '15 min .',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'LifeStyle',
                      style: TextStyle(color: _getRandomColor()),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.bookmark_border),
          onPressed: null,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _newsItemRow() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExactAssetImage('assets/images/city.jpg'),
              ),
            ),
            width: 124,
            height: 124,
            margin: EdgeInsets.only(right: 16),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Tech Tent: Old phones and safe social',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'We also talk about the future of work as the robots advance, and we ask whether a retro phone',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
