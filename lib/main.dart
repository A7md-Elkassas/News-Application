import 'package:flutter/material.dart';
import 'package:new_app/routes.dart';
import 'package:new_app/view_model/articles_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './Screens/first_screen.dart';
import './utilities/app_theme.dart';
import 'Screens/home_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  bool seen = _prefs.getBool('seen');
  Widget _screen;
  if (seen == null || seen == false) {
    _screen = FirstScreen();
  } else {
    _screen = HomeScreen();
  }
  runApp(HomePage(_screen));
}

class HomePage extends StatelessWidget {
  final Widget screen;
  HomePage(this.screen);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ArticlesViewModel(),
      child: MaterialApp(
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        routes: destinations,
        home: this.screen,
      ),
    );
  }
}
