import 'package:flutter/material.dart';

import 'views/screens/bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.grey.shade800,
      ),
      home: BottomNavigation(),
    );
  }
}
