import 'package:flutter/material.dart';
import 'package:flutter_rest_api/postscreen.dart';

import 'homescreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  (runApp(MyApp()));}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rest Api',
      debugShowCheckedModeBanner: false,
      home: PostScreen(),
    );
  }
}
