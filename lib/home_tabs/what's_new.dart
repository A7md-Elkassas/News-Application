import 'package:flutter/material.dart';
import 'package:new_app/widgets/header_section/header.dart';
import 'package:new_app/widgets/recent_update_section/recent_update.dart';
import 'package:new_app/widgets/top_stories_section/top_stories.dart';


class New extends StatefulWidget {
  @override
  _NewState createState() => _NewState();
}

class _NewState extends State<New> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(),
          TopStories(),
          RecentUpdate(),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  

  
}
