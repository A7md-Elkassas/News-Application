import 'package:flutter/material.dart';
import 'package:new_app/Screens/home_screen.dart';
import 'package:new_app/models/page_model.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstScreen extends StatefulWidget {
  static final String id = 'FirstScreen';
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<PageModel> pages = [
    PageModel(
        'Welcome',
        '1- Making Friends is easy as waving your hand back and forth in easy step.',
        Icons.ac_unit,
        'assets/images/city1.jpeg'),
    PageModel(
        'Accessability',
        '2- Making Friends is easy as waving your hand back and forth in easy step.',
        Icons.accessibility,
        'assets/images/city2.jpg'),
    PageModel(
        'Accessability New',
        '3- Making Friends is easy as waving your hand back and forth in easy step.',
        Icons.accessibility_new,
        'assets/images/city3.jpeg'),
  ];

  ValueNotifier<int> pageIndexNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(pages[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform.translate(
                        offset: Offset(0.0, -100),
                        child: Icon(
                          pages[index].icon,
                          color: Colors.white,
                          size: 150,
                        ),
                      ),
                      Text(
                        pages[index].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 48, vertical: 18),
                        child: Text(
                          pages[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: displayIndicator(
                          pages.length,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            onPageChanged: (value) {
              pageIndexNotifier.value = value;
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                width: double.infinity,
                child: RaisedButton(
                  child: Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      'GET STARTED',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  color: Color(0xffcc0001),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      _upgradeSeen();
                      return HomeScreen();
                    }));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget displayIndicator(int length) {
    return PageViewIndicator(
      pageIndexNotifier: pageIndexNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 15,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 15.0,
          color: Colors.red,
        ),
      ),
    );
  }
}

void _upgradeSeen() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('seen', true);
}
