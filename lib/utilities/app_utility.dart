import 'package:timeago/timeago.dart' as timeAgo; 
import 'package:flutter/material.dart';
 
 String parseDate(var time){
    Duration timeago = DateTime.now().difference(DateTime.parse(time));
    DateTime difference = DateTime.now().subtract(timeago);
    return timeAgo.format(difference);
  }

  Widget drawSection(String section) {
    return Text(
      section,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

     TextStyle headerStyle = TextStyle(
      fontSize: 22,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
    TextStyle headerTextDescription = TextStyle(
      color: Colors.white,
      fontSize: 16,
    );